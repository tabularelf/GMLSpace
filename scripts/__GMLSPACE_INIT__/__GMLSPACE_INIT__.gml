function GMLSpaceForceInit() {
	static __init__ = false;
	if (__init__) return;
	__init__ = true;
	Console();
	Math();
	String();
	Buffer();
}
GMLSpaceForceInit();
	
#macro __GMLSPACE_ARGUMENTS_ARRAY__ var _argsArray = array_create(argument_count); \
	for(var _i = 0; _i < argument_count; ++_i) { \
		_argsArray[_i] = argument[_i]; \	
	}

function __GMLSpaceExecute(_funcMethod, _args = undefined, _offset = 0, _len = undefined) {
	gml_pragma("forceinline");
	if (is_undefined(_args)) return _funcMethod();
	_len ??= array_length(_args);
	return is_method(_funcMethod) ? method_call(_funcMethod, _args, _offset, _len) : script_execute_ext(_funcMethod, _args, _offset, _len);
}