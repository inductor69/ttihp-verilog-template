open Base

let () =
  let t = Test_util.create () in
  Test_util.data_addr t 0;
  Test_util.data_write t 0x11;
  Test_util.data_write t 0x22;
  Test_util.data_write t 0x33;
  Stdio.print_endline (Printf.sprintf "readback: %02x %02x %02x"
                         (Test_util.data_read t 0) (Test_util.data_read t 1) (Test_util.data_read t 2))
