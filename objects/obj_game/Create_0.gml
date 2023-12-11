Console.Log("Hi {0}", Math.Power(2, 32));

var str = "Hello World!";
var buff = Buffer.Create(String.ByteLength(str), buffer_fixed, 1);
Buffer.Write(buff, buffer_text, "Hello World!");
Buffer.Seek(buff, buffer_seek_start, 0);
Console.Log(Buffer.Read(buff, buffer_text));
Buffer.Delete(buff);