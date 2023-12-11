function Console() {
	static __labels__ = {};
	static Log = show_debug_message;
	static Count = function(_label = "Default") {
		if (!struct_exists(__labels__, _label)) {
			__labels__[$ _label] = 0;	
		}
		return ++__labels__[$ _label];
	}
	
	static ResetCount = function(_label = "Default") {
		__labels__[$ _label] = 0;
	}
	
	static GetCount = function(_label = "Default") {
		if (!struct_exists(__labels__, _label)) {
			__labels__[$ _label] = 0;	
		}
		return __labels__[$ _label];
	}
}