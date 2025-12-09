module combo_system (
    input  clk,
    input  rst,

    // Stopwatch
    input  start_stop,

    output reg [5:0] sec,
    output reg [5:0] min,
    output reg [3:0] hour,

    // Traffic Light Output
    output reg [2:0] light
);

    //---------------------------------------------------------
    // TRAFFIC LIGHT FSM
    //---------------------------------------------------------
  
  
  // FSM States
    typedef enum logic [1:0] {
        RED    = 2'b00,
        GREEN  = 2'b01,
        YELLOW = 2'b10
    } state_t;

    state_t state, next_state;

    // Timings (in clock cycles)
    parameter RED_TIME    = 5;
    parameter GREEN_TIME  = 5;
    parameter YELLOW_TIME = 2;

    reg [3:0] timer;  // counts cycles in each state

    // --------------------------------------
    // Present State Update
    // --------------------------------------
  always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= RED;
            timer <= 0;
        end
        else begin
            state <= next_state;
            timer <= (state != next_state) ? 0 : timer + 1;
        end
    end

    // --------------------------------------
    // Next State Logic
    // --------------------------------------
    always @(*) begin
        case (state)
            RED:
                next_state = (timer == RED_TIME-1) ? GREEN : RED;

            GREEN:
                next_state = (timer == GREEN_TIME-1) ? YELLOW : GREEN;

            YELLOW:
                next_state = (timer == YELLOW_TIME-1) ? RED : YELLOW;

            default: next_state = RED;
        endcase
    end

    // --------------------------------------
    // Output Logic
    // --------------------------------------
    always @(*) begin
        case (state)
            RED:    light = 3'b100;
            YELLOW: light = 3'b010;
            GREEN:  light = 3'b001;
            default: light = 3'b100;
        endcase
    end



    //---------------------------------------------------------
    // STOPWATCH FSM
    //---------------------------------------------------------

    reg run;
    reg [5:0] sec_count;
    reg [5:0] min_count;
    reg [3:0] hour_count;

always @(posedge clk or posedge rst) begin
    if (rst) begin
      sec_count  <= 0;
      min_count  <= 0;
      hour_count <= 0;
      sec  <= 0;
      min  <= 0;
      hour <= 0;
      run  <= 0;
    end 
    
    else if (start_stop) begin
      run <= ~run;   // toggle run flag
    end 

    else if (run) begin
      if (sec_count == 59) begin
        sec_count <= 0;
        if (min_count == 59) begin
          min_count <= 0;
          if (hour_count == 23)
            hour_count <= 0;
          else
            hour_count <= hour_count + 1;
        end
        else
          min_count <= min_count + 1;
      end
      else
        sec_count <= sec_count + 1;

      // update visible values
      sec  <= sec_count;
      min  <= min_count;
      hour <= hour_count;
    end
  end

endmodule
