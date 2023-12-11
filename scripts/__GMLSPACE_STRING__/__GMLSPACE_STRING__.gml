function String(){
	static CharAt = string_char_at;
	static Concat = string_concat;
	static ConcatExt = string_concat_ext;
	static StartsWith = string_starts_with;
	static EndsWith = string_ends_with;
	static Repeat = string_repeat;
	static Length = string_length;
	static ByteLength = string_byte_length;
	static SetByteAt = string_set_byte_at;
	static Lower = string_lower;
	static Upper = string_upper;
	static Join = string_join;
	static Height = string_height;
	static HeightExt = string_height_ext;
	static Width = string_width;
	static WidthExt = string_width_ext;
	static Insert = string_insert;
	static Delete = string_delete;
	static Copy = string_copy;
	static Split = string_split;
	static SplitExt = string_split_ext;
	static Digits = string_digits;
	static Letters = string_letters;
	static Count = string_count;
	static Pos = string_pos;
	static Format = string_format;
	static PosExt = string_pos_ext;
	static LastPos = string_last_pos;
	static LastPosExt = string_last_pos_ext;
	static ReplaceAll = string_replace_all;
	static Replace = string_replace;
	static Chr = chr;
	static Ord = ord;
	static OrdAt = string_ord_at;
	static Trim = string_trim;
	static TrimStart = string_trim_start;
	static TrimEnd = string_trim_end;
	static Foreach = string_foreach;
	static Base64Encode = base64_encode;
	static Base64Decode = base64_decode;
	static MD5 = md5_string_utf8;
	static SHA1 = sha1_string_utf8;
	static IsString = is_string;
	
	// Actual function use
	if (argument_count > 0) {
		if (argument_count == 1) {
			return is_string(argument[0]) ? argument[0] : string(argument[0]);	
		} else {
			__GMLSPACE_ARGUMENTS_ARRAY__
			return __GMLSpaceExecute(string, _argsArray);
		}
	}
}