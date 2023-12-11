function Buffer() {
	static Create = buffer_create;
	static Resize = buffer_resize;
	static Read = buffer_read;
	static Write = buffer_write;
	static Seek = buffer_seek;
	static Tell = buffer_tell;
	static Peek = buffer_peek;
	static Poke = buffer_poke;
	static Compress = buffer_compress;
	static Decompress = buffer_decompress;
	static MD5 = buffer_md5;
	static SHA1 = buffer_sha1;
	static CRC32 = buffer_crc32;
	static Base64Encode = buffer_base64_encode;
	static Base64Decode = buffer_base64_decode;
	static Base64DecodeExt = buffer_base64_decode_ext;
	static Delete = buffer_delete;
	static Size = buffer_get_size;
	static Allignment = buffer_get_alignment;
	static Type = buffer_get_type;
	static Exists = buffer_exists;
	static Copy = buffer_copy;
	static SizeOf = buffer_sizeof;
	static Fill = buffer_fill;
	static FillExt = function(_buff, _offset, _type, _value, _size) {
		var _tell = buffer_tell(_buff);
		buffer_seek(_buff, buffer_seek_start, _offset);
		var _sizeOf = buffer_sizeof(_type);
		var _i = 0;
		while(buffer_tell(_buff) < _size-_offset) {
			buffer_write(_buff, _type, _value(_i));
			_i += _sizeOf;
		}
		buffer_seek(_buff, buffer_seek_start, _tell);
	};
	static Clone = function(_buff) {
		var _type = buffer_get_type(_buff), _alignment = buffer_get_alignment(_buff), _length = buffer_get_size(_buff);
		var _newBuff = buffer_create(_length, _type, _alignment);
		buffer_copy(_buff, 0, _length, _newBuff, 0);
		return _newBuff;
	};
	static CloneExt = function(_buff, _type = buffer_get_type(_buff), _alignment = buffer_get_alignment(_buff), _offset = 0, _length = buffer_get_size(_buff)) {
		var _newBuff = buffer_create(_length-_offset, _type, _alignment);
		buffer_copy(_buff, _offset, _length, _newBuff, 0);
		return _newBuff;
	};
}