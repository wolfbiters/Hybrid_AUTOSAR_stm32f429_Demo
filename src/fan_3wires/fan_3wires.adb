package body Fan_3wires is

   Count : BT.UInt32 := 0;

   function Get_Count return BT.UInt32 is
   begin
      return Count;
   end Get_Count;

   procedure Get_Timer_Count is
   begin
      Count := Current_Counter (Encoder_Timer);
      --  Set_Counter (Encoder_Timer, BT.UInt16'(0));
   end Get_Timer_Count;

   procedure Initialize is
   begin
      Enable_Clock (Encoder_Tach);
      Enable_Clock (Encoder_Timer);

      Configure_IO
        (Encoder_Tach,
         (Mode           => Mode_AF,
          AF             => Encoder_AF,
          Resistors      => Pull_Up,
          AF_Output_Type => Push_Pull,
          AF_Speed       => Speed_100MHz));

      Configure_Freq_Capture_Interface
        (Encoder_Timer,
         Trigger        => TI1_Edge_Detector,
         IC1_Polarity   => Rising);

      Configure
        (Encoder_Timer, Prescaler => 0, Period => BT.UInt32 (BT.UInt16'Last),
         Clock_Divisor            => Div1, Counter_Mode => Up);

      Configure_Channel_Input
        (Encoder_Timer, Channel => Channel_1, Polarity => Rising,
         Selection              => Direct_TI, Prescaler => Div1, Filter => 0);

      Enable_Channel (Encoder_Timer, Channel_1);
      Set_Counter (Encoder_Timer, BT.UInt16'(0));

      Enable_Interrupt (Encoder_Timer, Timer_CC1_Interrupt);

      Enable (Encoder_Timer);
   end Initialize;

--  begin
--   Initialize;
end Fan_3wires;
