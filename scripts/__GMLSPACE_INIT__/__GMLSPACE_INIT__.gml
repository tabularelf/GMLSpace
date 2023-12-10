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

#macro __GMLSPACE_PARENT_STATIC__ static __init__ = false; \
	if (!__init__) { \
		__init__ = true; \
		__GMLSpaceProcessStruct(__parent__); \
	} 
	
#macro __GMLSPACE_ARGUMENTS_ARRAY__ var _argsArray = array_create(argument_count); \
	for(var _i = 0; _i < argument_count; ++_i) { \
		_argsArray[_i] = argument[_i]; \	
	}

function __GMLSpaceProcessStruct(_struct) {
	static _iterator = function(_name, _value) {
		if (!is_method(_value) && is_callable(_value)) {
			_value = method(undefined, _value);
			self[$ _name] = _value;	
		}
		if (is_method(_value)) _value.Ext = __GMLSpacePartial(__GMLSpaceExecute, _value);
		if (!is_method(_value) && is_struct(_value) && _name != "__parent__") {
			__GMLSpaceProcessStruct(_value);
		}
	};
	
	struct_foreach(_struct, method(_struct, _iterator));
	return _struct;	
}

function __GMLSpacePartial(_func) {
	var _args = array_create(argument_count-1, undefined);
	var _i = 1;
	repeat(argument_count-1) {
		_args[_i-1] = argument[_i];
		++_i;
	}
	
	return method({
		func : _func,
		len : argument_count-1,
		closure : _args
	}, function() {
		var args = array_create(len + argument_count);
		array_copy(args, 0, closure, 0, len);
		for (var i = argument_count - 1; i >= 0; i -= 1) {
			args[len + i] = argument[i];
		}
		return method_call(func, args);
	}); 
}

function __GMLSpaceExecute(_funcMethod, _args = undefined, _offset = 0, _len = undefined) {
	gml_pragma("forceinline");
	if (is_undefined(_args)) return _funcMethod();
	_len ??= array_length(_args);
	return is_method(_funcMethod) ? method_call(_funcMethod, _args, _offset, _len) : script_execute_ext(_funcMethod, _args, _offset, _len);
}