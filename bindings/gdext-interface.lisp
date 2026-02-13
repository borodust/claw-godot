(uiop/package:define-package :%gdext.interface (:use :cl))
(common-lisp:in-package :%gdext.interface)

(%gdext.common:defifun ("get_godot_version" get-godot-version)
                       :void
                       (r-godot-version
                        (:pointer %gdext.types::godot-version)))

(%gdext.common:defifun ("get_godot_version2" get-godot-version2)
                       :void
                       (r-godot-version
                        (:pointer %gdext.types::godot-version2)))

(%gdext.common:defifun ("mem_alloc" mem-alloc)
                       (:pointer :void)
                       (p-bytes :size))

(%gdext.common:defifun ("mem_realloc" mem-realloc)
                       (:pointer :void)
                       (p-ptr (:pointer :void))
                       (p-bytes :size))

(%gdext.common:defifun ("mem_free" mem-free)
                       :void
                       (p-ptr (:pointer :void)))

(%gdext.common:defifun ("mem_alloc2" mem-alloc2)
                       (:pointer :void)
                       (p-bytes :size)
                       (p-pad-align %gdext.types::bool))

(%gdext.common:defifun ("mem_realloc2" mem-realloc2)
                       (:pointer :void)
                       (p-ptr (:pointer :void))
                       (p-bytes :size)
                       (p-pad-align %gdext.types::bool))

(%gdext.common:defifun ("mem_free2" mem-free2)
                       :void
                       (p-ptr (:pointer :void))
                       (p-pad-align %gdext.types::bool))

(%gdext.common:defifun ("print_error" print-error)
                       :void
                       (p-description (:pointer :char))
                       (p-function (:pointer :char))
                       (p-file (:pointer :char))
                       (p-line :int32)
                       (p-editor-notify %gdext.types::bool))

(%gdext.common:defifun ("print_error_with_message"
                        print-error-with-message)
                       :void
                       (p-description (:pointer :char))
                       (p-message (:pointer :char))
                       (p-function (:pointer :char))
                       (p-file (:pointer :char))
                       (p-line :int32)
                       (p-editor-notify %gdext.types::bool))

(%gdext.common:defifun ("print_warning" print-warning)
                       :void
                       (p-description (:pointer :char))
                       (p-function (:pointer :char))
                       (p-file (:pointer :char))
                       (p-line :int32)
                       (p-editor-notify %gdext.types::bool))

(%gdext.common:defifun ("print_warning_with_message"
                        print-warning-with-message)
                       :void
                       (p-description (:pointer :char))
                       (p-message (:pointer :char))
                       (p-function (:pointer :char))
                       (p-file (:pointer :char))
                       (p-line :int32)
                       (p-editor-notify %gdext.types::bool))

(%gdext.common:defifun ("print_script_error" print-script-error)
                       :void
                       (p-description (:pointer :char))
                       (p-function (:pointer :char))
                       (p-file (:pointer :char))
                       (p-line :int32)
                       (p-editor-notify %gdext.types::bool))

(%gdext.common:defifun ("print_script_error_with_message"
                        print-script-error-with-message)
                       :void
                       (p-description (:pointer :char))
                       (p-message (:pointer :char))
                       (p-function (:pointer :char))
                       (p-file (:pointer :char))
                       (p-line :int32)
                       (p-editor-notify %gdext.types::bool))

(%gdext.common:defifun ("get_native_struct_size"
                        get-native-struct-size)
                       :uint64
                       (p-name %gdext.types::const-string-name-ptr))

(%gdext.common:defifun ("variant_new_copy" variant-new-copy)
                       :void
                       (r-dest
                        %gdext.types::uninitialized-variant-ptr)
                       (p-src %gdext.types::const-variant-ptr))

(%gdext.common:defifun ("variant_new_nil" variant-new-nil)
                       :void
                       (r-dest
                        %gdext.types::uninitialized-variant-ptr))

(%gdext.common:defifun ("variant_destroy" variant-destroy)
                       :void
                       (p-self %gdext.types::variant-ptr))

(%gdext.common:defifun ("variant_call" variant-call)
                       :void
                       (p-self %gdext.types::variant-ptr)
                       (p-method %gdext.types::const-string-name-ptr)
                       (p-args
                        (:pointer %gdext.types::const-variant-ptr))
                       (p-argument-count %gdext.types::int)
                       (r-return
                        %gdext.types::uninitialized-variant-ptr)
                       (r-error (:pointer %gdext.types::call-error)))

(%gdext.common:defifun ("variant_call_static" variant-call-static)
                       :void
                       (p-type %gdext.types::variant-type)
                       (p-method %gdext.types::const-string-name-ptr)
                       (p-args
                        (:pointer %gdext.types::const-variant-ptr))
                       (p-argument-count %gdext.types::int)
                       (r-return
                        %gdext.types::uninitialized-variant-ptr)
                       (r-error (:pointer %gdext.types::call-error)))

(%gdext.common:defifun ("variant_evaluate" variant-evaluate)
                       :void
                       (p-op %gdext.types::variant-operator)
                       (p-a %gdext.types::const-variant-ptr)
                       (p-b %gdext.types::const-variant-ptr)
                       (r-return
                        %gdext.types::uninitialized-variant-ptr)
                       (r-valid (:pointer %gdext.types::bool)))

(%gdext.common:defifun ("variant_set" variant-set)
                       :void
                       (p-self %gdext.types::variant-ptr)
                       (p-key %gdext.types::const-variant-ptr)
                       (p-value %gdext.types::const-variant-ptr)
                       (r-valid (:pointer %gdext.types::bool)))

(%gdext.common:defifun ("variant_set_named" variant-set-named)
                       :void
                       (p-self %gdext.types::variant-ptr)
                       (p-key %gdext.types::const-string-name-ptr)
                       (p-value %gdext.types::const-variant-ptr)
                       (r-valid (:pointer %gdext.types::bool)))

(%gdext.common:defifun ("variant_set_keyed" variant-set-keyed)
                       :void
                       (p-self %gdext.types::variant-ptr)
                       (p-key %gdext.types::const-variant-ptr)
                       (p-value %gdext.types::const-variant-ptr)
                       (r-valid (:pointer %gdext.types::bool)))

(%gdext.common:defifun ("variant_set_indexed" variant-set-indexed)
                       :void
                       (p-self %gdext.types::variant-ptr)
                       (p-index %gdext.types::int)
                       (p-value %gdext.types::const-variant-ptr)
                       (r-valid (:pointer %gdext.types::bool))
                       (r-oob (:pointer %gdext.types::bool)))

(%gdext.common:defifun ("variant_get" variant-get)
                       :void
                       (p-self %gdext.types::const-variant-ptr)
                       (p-key %gdext.types::const-variant-ptr)
                       (r-ret
                        %gdext.types::uninitialized-variant-ptr)
                       (r-valid (:pointer %gdext.types::bool)))

(%gdext.common:defifun ("variant_get_named" variant-get-named)
                       :void
                       (p-self %gdext.types::const-variant-ptr)
                       (p-key %gdext.types::const-string-name-ptr)
                       (r-ret
                        %gdext.types::uninitialized-variant-ptr)
                       (r-valid (:pointer %gdext.types::bool)))

(%gdext.common:defifun ("variant_get_keyed" variant-get-keyed)
                       :void
                       (p-self %gdext.types::const-variant-ptr)
                       (p-key %gdext.types::const-variant-ptr)
                       (r-ret
                        %gdext.types::uninitialized-variant-ptr)
                       (r-valid (:pointer %gdext.types::bool)))

(%gdext.common:defifun ("variant_get_indexed" variant-get-indexed)
                       :void
                       (p-self %gdext.types::const-variant-ptr)
                       (p-index %gdext.types::int)
                       (r-ret
                        %gdext.types::uninitialized-variant-ptr)
                       (r-valid (:pointer %gdext.types::bool))
                       (r-oob (:pointer %gdext.types::bool)))

(%gdext.common:defifun ("variant_iter_init" variant-iter-init)
                       %gdext.types::bool
                       (p-self %gdext.types::const-variant-ptr)
                       (r-iter
                        %gdext.types::uninitialized-variant-ptr)
                       (r-valid (:pointer %gdext.types::bool)))

(%gdext.common:defifun ("variant_iter_next" variant-iter-next)
                       %gdext.types::bool
                       (p-self %gdext.types::const-variant-ptr)
                       (r-iter %gdext.types::variant-ptr)
                       (r-valid (:pointer %gdext.types::bool)))

(%gdext.common:defifun ("variant_iter_get" variant-iter-get)
                       :void
                       (p-self %gdext.types::const-variant-ptr)
                       (r-iter %gdext.types::variant-ptr)
                       (r-ret
                        %gdext.types::uninitialized-variant-ptr)
                       (r-valid (:pointer %gdext.types::bool)))

(%gdext.common:defifun ("variant_hash" variant-hash)
                       %gdext.types::int
                       (p-self %gdext.types::const-variant-ptr))

(%gdext.common:defifun ("variant_recursive_hash"
                        variant-recursive-hash)
                       %gdext.types::int
                       (p-self %gdext.types::const-variant-ptr)
                       (p-recursion-count %gdext.types::int))

(%gdext.common:defifun ("variant_hash_compare" variant-hash-compare)
                       %gdext.types::bool
                       (p-self %gdext.types::const-variant-ptr)
                       (p-other %gdext.types::const-variant-ptr))

(%gdext.common:defifun ("variant_booleanize" variant-booleanize)
                       %gdext.types::bool
                       (p-self %gdext.types::const-variant-ptr))

(%gdext.common:defifun ("variant_duplicate" variant-duplicate)
                       :void
                       (p-self %gdext.types::const-variant-ptr)
                       (r-ret %gdext.types::variant-ptr)
                       (p-deep %gdext.types::bool))

(%gdext.common:defifun ("variant_stringify" variant-stringify)
                       :void
                       (p-self %gdext.types::const-variant-ptr)
                       (r-ret %gdext.types::string-ptr))

(%gdext.common:defifun ("variant_get_type" variant-get-type)
                       %gdext.types::variant-type
                       (p-self %gdext.types::const-variant-ptr))

(%gdext.common:defifun ("variant_has_method" variant-has-method)
                       %gdext.types::bool
                       (p-self %gdext.types::const-variant-ptr)
                       (p-method %gdext.types::const-string-name-ptr))

(%gdext.common:defifun ("variant_has_member" variant-has-member)
                       %gdext.types::bool
                       (p-type %gdext.types::variant-type)
                       (p-member %gdext.types::const-string-name-ptr))

(%gdext.common:defifun ("variant_has_key" variant-has-key)
                       %gdext.types::bool
                       (p-self %gdext.types::const-variant-ptr)
                       (p-key %gdext.types::const-variant-ptr)
                       (r-valid (:pointer %gdext.types::bool)))

(%gdext.common:defifun ("variant_get_object_instance_id"
                        variant-get-object-instance-id)
                       %gdext.types::instance-id
                       (p-self %gdext.types::const-variant-ptr))

(%gdext.common:defifun ("variant_get_type_name"
                        variant-get-type-name)
                       :void
                       (p-type %gdext.types::variant-type)
                       (r-name
                        %gdext.types::uninitialized-string-ptr))

(%gdext.common:defifun ("variant_can_convert" variant-can-convert)
                       %gdext.types::bool
                       (p-from %gdext.types::variant-type)
                       (p-to %gdext.types::variant-type))

(%gdext.common:defifun ("variant_can_convert_strict"
                        variant-can-convert-strict)
                       %gdext.types::bool
                       (p-from %gdext.types::variant-type)
                       (p-to %gdext.types::variant-type))

(%gdext.common:defifun ("get_variant_from_type_constructor"
                        get-variant-from-type-constructor)
                       %gdext.types::variant-from-type-constructor-func
                       (p-type %gdext.types::variant-type))

(%gdext.common:defifun ("get_variant_to_type_constructor"
                        get-variant-to-type-constructor)
                       %gdext.types::type-from-variant-constructor-func
                       (p-type %gdext.types::variant-type))

(%gdext.common:defifun ("variant_get_ptr_internal_getter"
                        variant-get-ptr-internal-getter)
                       %gdext.types::variant-get-internal-ptr-func
                       (p-type %gdext.types::variant-type))

(%gdext.common:defifun ("variant_get_ptr_operator_evaluator"
                        variant-get-ptr-operator-evaluator)
                       %gdext.types::ptr-operator-evaluator
                       (p-operator %gdext.types::variant-operator)
                       (p-type-a %gdext.types::variant-type)
                       (p-type-b %gdext.types::variant-type))

(%gdext.common:defifun ("variant_get_ptr_builtin_method"
                        variant-get-ptr-builtin-method)
                       %gdext.types::ptr-built-in-method
                       (p-type %gdext.types::variant-type)
                       (p-method %gdext.types::const-string-name-ptr)
                       (p-hash %gdext.types::int))

(%gdext.common:defifun ("variant_get_ptr_constructor"
                        variant-get-ptr-constructor)
                       %gdext.types::ptr-constructor
                       (p-type %gdext.types::variant-type)
                       (p-constructor :int32))

(%gdext.common:defifun ("variant_get_ptr_destructor"
                        variant-get-ptr-destructor)
                       %gdext.types::ptr-destructor
                       (p-type %gdext.types::variant-type))

(%gdext.common:defifun ("variant_construct" variant-construct)
                       :void
                       (p-type %gdext.types::variant-type)
                       (r-base
                        %gdext.types::uninitialized-variant-ptr)
                       (p-args
                        (:pointer %gdext.types::const-variant-ptr))
                       (p-argument-count :int32)
                       (r-error (:pointer %gdext.types::call-error)))

(%gdext.common:defifun ("variant_get_ptr_setter"
                        variant-get-ptr-setter)
                       %gdext.types::ptr-setter
                       (p-type %gdext.types::variant-type)
                       (p-member %gdext.types::const-string-name-ptr))

(%gdext.common:defifun ("variant_get_ptr_getter"
                        variant-get-ptr-getter)
                       %gdext.types::ptr-getter
                       (p-type %gdext.types::variant-type)
                       (p-member %gdext.types::const-string-name-ptr))

(%gdext.common:defifun ("variant_get_ptr_indexed_setter"
                        variant-get-ptr-indexed-setter)
                       %gdext.types::ptr-indexed-setter
                       (p-type %gdext.types::variant-type))

(%gdext.common:defifun ("variant_get_ptr_indexed_getter"
                        variant-get-ptr-indexed-getter)
                       %gdext.types::ptr-indexed-getter
                       (p-type %gdext.types::variant-type))

(%gdext.common:defifun ("variant_get_ptr_keyed_setter"
                        variant-get-ptr-keyed-setter)
                       %gdext.types::ptr-keyed-setter
                       (p-type %gdext.types::variant-type))

(%gdext.common:defifun ("variant_get_ptr_keyed_getter"
                        variant-get-ptr-keyed-getter)
                       %gdext.types::ptr-keyed-getter
                       (p-type %gdext.types::variant-type))

(%gdext.common:defifun ("variant_get_ptr_keyed_checker"
                        variant-get-ptr-keyed-checker)
                       %gdext.types::ptr-keyed-checker
                       (p-type %gdext.types::variant-type))

(%gdext.common:defifun ("variant_get_constant_value"
                        variant-get-constant-value)
                       :void
                       (p-type %gdext.types::variant-type)
                       (p-constant
                        %gdext.types::const-string-name-ptr)
                       (r-ret
                        %gdext.types::uninitialized-variant-ptr))

(%gdext.common:defifun ("variant_get_ptr_utility_function"
                        variant-get-ptr-utility-function)
                       %gdext.types::ptr-utility-function
                       (p-function
                        %gdext.types::const-string-name-ptr)
                       (p-hash %gdext.types::int))

(%gdext.common:defifun ("string_new_with_latin1_chars"
                        string-new-with-latin1-chars)
                       :void
                       (r-dest
                        %gdext.types::uninitialized-string-ptr)
                       (p-contents (:pointer :char)))

(%gdext.common:defifun ("string_new_with_utf8_chars"
                        string-new-with-utf8-chars)
                       :void
                       (r-dest
                        %gdext.types::uninitialized-string-ptr)
                       (p-contents (:pointer :char)))

(%gdext.common:defifun ("string_new_with_utf16_chars"
                        string-new-with-utf16-chars)
                       :void
                       (r-dest
                        %gdext.types::uninitialized-string-ptr)
                       (p-contents (:pointer :uint16)))

(%gdext.common:defifun ("string_new_with_utf32_chars"
                        string-new-with-utf32-chars)
                       :void
                       (r-dest
                        %gdext.types::uninitialized-string-ptr)
                       (p-contents (:pointer :uint32)))

(%gdext.common:defifun ("string_new_with_wide_chars"
                        string-new-with-wide-chars)
                       :void
                       (r-dest
                        %gdext.types::uninitialized-string-ptr)
                       (p-contents (:pointer %gdext.common:wchar)))

(%gdext.common:defifun ("string_new_with_latin1_chars_and_len"
                        string-new-with-latin1-chars-and-len)
                       :void
                       (r-dest
                        %gdext.types::uninitialized-string-ptr)
                       (p-contents (:pointer :char))
                       (p-size %gdext.types::int))

(%gdext.common:defifun ("string_new_with_utf8_chars_and_len"
                        string-new-with-utf8-chars-and-len)
                       :void
                       (r-dest
                        %gdext.types::uninitialized-string-ptr)
                       (p-contents (:pointer :char))
                       (p-size %gdext.types::int))

(%gdext.common:defifun ("string_new_with_utf8_chars_and_len2"
                        string-new-with-utf8-chars-and-len2)
                       %gdext.types::int
                       (r-dest
                        %gdext.types::uninitialized-string-ptr)
                       (p-contents (:pointer :char))
                       (p-size %gdext.types::int))

(%gdext.common:defifun ("string_new_with_utf16_chars_and_len"
                        string-new-with-utf16-chars-and-len)
                       :void
                       (r-dest
                        %gdext.types::uninitialized-string-ptr)
                       (p-contents (:pointer :uint16))
                       (p-char-count %gdext.types::int))

(%gdext.common:defifun ("string_new_with_utf16_chars_and_len2"
                        string-new-with-utf16-chars-and-len2)
                       %gdext.types::int
                       (r-dest
                        %gdext.types::uninitialized-string-ptr)
                       (p-contents (:pointer :uint16))
                       (p-char-count %gdext.types::int)
                       (p-default-little-endian %gdext.types::bool))

(%gdext.common:defifun ("string_new_with_utf32_chars_and_len"
                        string-new-with-utf32-chars-and-len)
                       :void
                       (r-dest
                        %gdext.types::uninitialized-string-ptr)
                       (p-contents (:pointer :uint32))
                       (p-char-count %gdext.types::int))

(%gdext.common:defifun ("string_new_with_wide_chars_and_len"
                        string-new-with-wide-chars-and-len)
                       :void
                       (r-dest
                        %gdext.types::uninitialized-string-ptr)
                       (p-contents (:pointer %gdext.common:wchar))
                       (p-char-count %gdext.types::int))

(%gdext.common:defifun ("string_to_latin1_chars"
                        string-to-latin1-chars)
                       %gdext.types::int
                       (p-self %gdext.types::const-string-ptr)
                       (r-text (:pointer :char))
                       (p-max-write-length %gdext.types::int))

(%gdext.common:defifun ("string_to_utf8_chars" string-to-utf8-chars)
                       %gdext.types::int
                       (p-self %gdext.types::const-string-ptr)
                       (r-text (:pointer :char))
                       (p-max-write-length %gdext.types::int))

(%gdext.common:defifun ("string_to_utf16_chars"
                        string-to-utf16-chars)
                       %gdext.types::int
                       (p-self %gdext.types::const-string-ptr)
                       (r-text (:pointer :uint16))
                       (p-max-write-length %gdext.types::int))

(%gdext.common:defifun ("string_to_utf32_chars"
                        string-to-utf32-chars)
                       %gdext.types::int
                       (p-self %gdext.types::const-string-ptr)
                       (r-text (:pointer :uint32))
                       (p-max-write-length %gdext.types::int))

(%gdext.common:defifun ("string_to_wide_chars" string-to-wide-chars)
                       %gdext.types::int
                       (p-self %gdext.types::const-string-ptr)
                       (r-text (:pointer %gdext.common:wchar))
                       (p-max-write-length %gdext.types::int))

(%gdext.common:defifun ("string_operator_index"
                        string-operator-index)
                       (:pointer :uint32)
                       (p-self %gdext.types::string-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("string_operator_index_const"
                        string-operator-index-const)
                       (:pointer :uint32)
                       (p-self %gdext.types::const-string-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("string_operator_plus_eq_string"
                        string-operator-plus-eq-string)
                       :void
                       (p-self %gdext.types::string-ptr)
                       (p-b %gdext.types::const-string-ptr))

(%gdext.common:defifun ("string_operator_plus_eq_char"
                        string-operator-plus-eq-char)
                       :void
                       (p-self %gdext.types::string-ptr)
                       (p-b :uint32))

(%gdext.common:defifun ("string_operator_plus_eq_cstr"
                        string-operator-plus-eq-cstr)
                       :void
                       (p-self %gdext.types::string-ptr)
                       (p-b (:pointer :char)))

(%gdext.common:defifun ("string_operator_plus_eq_wcstr"
                        string-operator-plus-eq-wcstr)
                       :void
                       (p-self %gdext.types::string-ptr)
                       (p-b (:pointer %gdext.common:wchar)))

(%gdext.common:defifun ("string_operator_plus_eq_c32str"
                        string-operator-plus-eq-c32str)
                       :void
                       (p-self %gdext.types::string-ptr)
                       (p-b (:pointer :uint32)))

(%gdext.common:defifun ("string_resize" string-resize)
                       %gdext.types::int
                       (p-self %gdext.types::string-ptr)
                       (p-resize %gdext.types::int))

(%gdext.common:defifun ("string_name_new_with_latin1_chars"
                        string-name-new-with-latin1-chars)
                       :void
                       (r-dest
                        %gdext.types::uninitialized-string-name-ptr)
                       (p-contents (:pointer :char))
                       (p-is-static %gdext.types::bool))

(%gdext.common:defifun ("string_name_new_with_utf8_chars"
                        string-name-new-with-utf8-chars)
                       :void
                       (r-dest
                        %gdext.types::uninitialized-string-name-ptr)
                       (p-contents (:pointer :char)))

(%gdext.common:defifun ("string_name_new_with_utf8_chars_and_len"
                        string-name-new-with-utf8-chars-and-len)
                       :void
                       (r-dest
                        %gdext.types::uninitialized-string-name-ptr)
                       (p-contents (:pointer :char))
                       (p-size %gdext.types::int))

(%gdext.common:defifun ("xml_parser_open_buffer"
                        xml-parser-open-buffer)
                       %gdext.types::int
                       (p-instance %gdext.types::object-ptr)
                       (p-buffer (:pointer :uint8))
                       (p-size :size))

(%gdext.common:defifun ("file_access_store_buffer"
                        file-access-store-buffer)
                       :void
                       (p-instance %gdext.types::object-ptr)
                       (p-src (:pointer :uint8))
                       (p-length :uint64))

(%gdext.common:defifun ("file_access_get_buffer"
                        file-access-get-buffer)
                       :uint64
                       (p-instance %gdext.types::const-object-ptr)
                       (p-dst (:pointer :uint8))
                       (p-length :uint64))

(%gdext.common:defifun ("image_ptrw" image-ptrw)
                       (:pointer :uint8)
                       (p-instance %gdext.types::object-ptr))

(%gdext.common:defifun ("image_ptr" image-ptr)
                       (:pointer :uint8)
                       (p-instance %gdext.types::object-ptr))

(%gdext.common:defifun ("worker_thread_pool_add_native_group_task"
                        worker-thread-pool-add-native-group-task)
                       :int64
                       (p-instance %gdext.types::object-ptr)
                       (p-func
                        %gdext.types::worker-thread-pool-group-task)
                       (p-userdata (:pointer :void))
                       (p-elements :int32)
                       (p-tasks :int32)
                       (p-high-priority %gdext.types::bool)
                       (p-description %gdext.types::const-string-ptr))

(%gdext.common:defifun ("worker_thread_pool_add_native_task"
                        worker-thread-pool-add-native-task)
                       :int64
                       (p-instance %gdext.types::object-ptr)
                       (p-func %gdext.types::worker-thread-pool-task)
                       (p-userdata (:pointer :void))
                       (p-high-priority %gdext.types::bool)
                       (p-description %gdext.types::const-string-ptr))

(%gdext.common:defifun ("packed_byte_array_operator_index"
                        packed-byte-array-operator-index)
                       (:pointer :uint8)
                       (p-self %gdext.types::type-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("packed_byte_array_operator_index_const"
                        packed-byte-array-operator-index-const)
                       (:pointer :uint8)
                       (p-self %gdext.types::const-type-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("packed_float32_array_operator_index"
                        packed-float32-array-operator-index)
                       (:pointer :float)
                       (p-self %gdext.types::type-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("packed_float32_array_operator_index_const"
                        packed-float32-array-operator-index-const)
                       (:pointer :float)
                       (p-self %gdext.types::const-type-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("packed_float64_array_operator_index"
                        packed-float64-array-operator-index)
                       (:pointer :double)
                       (p-self %gdext.types::type-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("packed_float64_array_operator_index_const"
                        packed-float64-array-operator-index-const)
                       (:pointer :double)
                       (p-self %gdext.types::const-type-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("packed_int32_array_operator_index"
                        packed-int32-array-operator-index)
                       (:pointer :int32)
                       (p-self %gdext.types::type-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("packed_int32_array_operator_index_const"
                        packed-int32-array-operator-index-const)
                       (:pointer :int32)
                       (p-self %gdext.types::const-type-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("packed_int64_array_operator_index"
                        packed-int64-array-operator-index)
                       (:pointer :int64)
                       (p-self %gdext.types::type-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("packed_int64_array_operator_index_const"
                        packed-int64-array-operator-index-const)
                       (:pointer :int64)
                       (p-self %gdext.types::const-type-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("packed_string_array_operator_index"
                        packed-string-array-operator-index)
                       %gdext.types::string-ptr
                       (p-self %gdext.types::type-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("packed_string_array_operator_index_const"
                        packed-string-array-operator-index-const)
                       %gdext.types::string-ptr
                       (p-self %gdext.types::const-type-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("packed_vector2_array_operator_index"
                        packed-vector2-array-operator-index)
                       %gdext.types::type-ptr
                       (p-self %gdext.types::type-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("packed_vector2_array_operator_index_const"
                        packed-vector2-array-operator-index-const)
                       %gdext.types::type-ptr
                       (p-self %gdext.types::const-type-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("packed_vector3_array_operator_index"
                        packed-vector3-array-operator-index)
                       %gdext.types::type-ptr
                       (p-self %gdext.types::type-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("packed_vector3_array_operator_index_const"
                        packed-vector3-array-operator-index-const)
                       %gdext.types::type-ptr
                       (p-self %gdext.types::const-type-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("packed_vector4_array_operator_index"
                        packed-vector4-array-operator-index)
                       %gdext.types::type-ptr
                       (p-self %gdext.types::type-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("packed_vector4_array_operator_index_const"
                        packed-vector4-array-operator-index-const)
                       %gdext.types::type-ptr
                       (p-self %gdext.types::const-type-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("packed_color_array_operator_index"
                        packed-color-array-operator-index)
                       %gdext.types::type-ptr
                       (p-self %gdext.types::type-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("packed_color_array_operator_index_const"
                        packed-color-array-operator-index-const)
                       %gdext.types::type-ptr
                       (p-self %gdext.types::const-type-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("array_operator_index" array-operator-index)
                       %gdext.types::variant-ptr
                       (p-self %gdext.types::type-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("array_operator_index_const"
                        array-operator-index-const)
                       %gdext.types::variant-ptr
                       (p-self %gdext.types::const-type-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("array_ref" array-ref)
                       :void
                       (p-self %gdext.types::type-ptr)
                       (p-from %gdext.types::const-type-ptr))

(%gdext.common:defifun ("array_set_typed" array-set-typed)
                       :void
                       (p-self %gdext.types::type-ptr)
                       (p-type %gdext.types::variant-type)
                       (p-class-name
                        %gdext.types::const-string-name-ptr)
                       (p-script %gdext.types::const-variant-ptr))

(%gdext.common:defifun ("dictionary_operator_index"
                        dictionary-operator-index)
                       %gdext.types::variant-ptr
                       (p-self %gdext.types::type-ptr)
                       (p-key %gdext.types::const-variant-ptr))

(%gdext.common:defifun ("dictionary_operator_index_const"
                        dictionary-operator-index-const)
                       %gdext.types::variant-ptr
                       (p-self %gdext.types::const-type-ptr)
                       (p-key %gdext.types::const-variant-ptr))

(%gdext.common:defifun ("dictionary_set_typed" dictionary-set-typed)
                       :void
                       (p-self %gdext.types::type-ptr)
                       (p-key-type %gdext.types::variant-type)
                       (p-key-class-name
                        %gdext.types::const-string-name-ptr)
                       (p-key-script %gdext.types::const-variant-ptr)
                       (p-value-type %gdext.types::variant-type)
                       (p-value-class-name
                        %gdext.types::const-string-name-ptr)
                       (p-value-script
                        %gdext.types::const-variant-ptr))

(%gdext.common:defifun ("object_method_bind_call"
                        object-method-bind-call)
                       :void
                       (p-method-bind %gdext.types::method-bind-ptr)
                       (p-instance %gdext.types::object-ptr)
                       (p-args
                        (:pointer %gdext.types::const-variant-ptr))
                       (p-arg-count %gdext.types::int)
                       (r-ret
                        %gdext.types::uninitialized-variant-ptr)
                       (r-error (:pointer %gdext.types::call-error)))

(%gdext.common:defifun ("object_method_bind_ptrcall"
                        object-method-bind-ptrcall)
                       :void
                       (p-method-bind %gdext.types::method-bind-ptr)
                       (p-instance %gdext.types::object-ptr)
                       (p-args
                        (:pointer %gdext.types::const-type-ptr))
                       (r-ret %gdext.types::type-ptr))

(%gdext.common:defifun ("object_destroy" object-destroy)
                       :void
                       (p-o %gdext.types::object-ptr))

(%gdext.common:defifun ("global_get_singleton" global-get-singleton)
                       %gdext.types::object-ptr
                       (p-name %gdext.types::const-string-name-ptr))

(%gdext.common:defifun ("object_get_instance_binding"
                        object-get-instance-binding)
                       (:pointer :void)
                       (p-o %gdext.types::object-ptr)
                       (p-token (:pointer :void))
                       (p-callbacks
                        (:pointer
                         %gdext.types::instance-binding-callbacks)))

(%gdext.common:defifun ("object_set_instance_binding"
                        object-set-instance-binding)
                       :void
                       (p-o %gdext.types::object-ptr)
                       (p-token (:pointer :void))
                       (p-binding (:pointer :void))
                       (p-callbacks
                        (:pointer
                         %gdext.types::instance-binding-callbacks)))

(%gdext.common:defifun ("object_free_instance_binding"
                        object-free-instance-binding)
                       :void
                       (p-o %gdext.types::object-ptr)
                       (p-token (:pointer :void)))

(%gdext.common:defifun ("object_set_instance" object-set-instance)
                       :void
                       (p-o %gdext.types::object-ptr)
                       (p-classname
                        %gdext.types::const-string-name-ptr)
                       (p-instance %gdext.types::class-instance-ptr))

(%gdext.common:defifun ("object_get_class_name"
                        object-get-class-name)
                       %gdext.types::bool
                       (p-object %gdext.types::const-object-ptr)
                       (p-library %gdext.types::class-library-ptr)
                       (r-class-name
                        %gdext.types::uninitialized-string-name-ptr))

(%gdext.common:defifun ("object_cast_to" object-cast-to)
                       %gdext.types::object-ptr
                       (p-object %gdext.types::const-object-ptr)
                       (p-class-tag (:pointer :void)))

(%gdext.common:defifun ("object_get_instance_from_id"
                        object-get-instance-from-id)
                       %gdext.types::object-ptr
                       (p-instance-id %gdext.types::instance-id))

(%gdext.common:defifun ("object_get_instance_id"
                        object-get-instance-id)
                       %gdext.types::instance-id
                       (p-object %gdext.types::const-object-ptr))

(%gdext.common:defifun ("object_has_script_method"
                        object-has-script-method)
                       %gdext.types::bool
                       (p-object %gdext.types::const-object-ptr)
                       (p-method %gdext.types::const-string-name-ptr))

(%gdext.common:defifun ("object_call_script_method"
                        object-call-script-method)
                       :void
                       (p-object %gdext.types::object-ptr)
                       (p-method %gdext.types::const-string-name-ptr)
                       (p-args
                        (:pointer %gdext.types::const-variant-ptr))
                       (p-argument-count %gdext.types::int)
                       (r-return
                        %gdext.types::uninitialized-variant-ptr)
                       (r-error (:pointer %gdext.types::call-error)))

(%gdext.common:defifun ("ref_get_object" ref-get-object)
                       %gdext.types::object-ptr
                       (p-ref %gdext.types::const-ref-ptr))

(%gdext.common:defifun ("ref_set_object" ref-set-object)
                       :void
                       (p-ref %gdext.types::ref-ptr)
                       (p-object %gdext.types::object-ptr))

(%gdext.common:defifun ("script_instance_create"
                        script-instance-create)
                       %gdext.types::script-instance-ptr
                       (p-info
                        (:pointer
                         %gdext.types::script-instance-info))
                       (p-instance-data
                        %gdext.types::script-instance-data-ptr))

(%gdext.common:defifun ("script_instance_create2"
                        script-instance-create2)
                       %gdext.types::script-instance-ptr
                       (p-info
                        (:pointer
                         %gdext.types::script-instance-info2))
                       (p-instance-data
                        %gdext.types::script-instance-data-ptr))

(%gdext.common:defifun ("script_instance_create3"
                        script-instance-create3)
                       %gdext.types::script-instance-ptr
                       (p-info
                        (:pointer
                         %gdext.types::script-instance-info3))
                       (p-instance-data
                        %gdext.types::script-instance-data-ptr))

(%gdext.common:defifun ("placeholder_script_instance_create"
                        placeholder-script-instance-create)
                       %gdext.types::script-instance-ptr
                       (p-language %gdext.types::object-ptr)
                       (p-script %gdext.types::object-ptr)
                       (p-owner %gdext.types::object-ptr))

(%gdext.common:defifun ("placeholder_script_instance_update"
                        placeholder-script-instance-update)
                       :void
                       (p-placeholder
                        %gdext.types::script-instance-ptr)
                       (p-properties %gdext.types::const-type-ptr)
                       (p-values %gdext.types::const-type-ptr))

(%gdext.common:defifun ("object_get_script_instance"
                        object-get-script-instance)
                       %gdext.types::script-instance-data-ptr
                       (p-object %gdext.types::const-object-ptr)
                       (p-language %gdext.types::object-ptr))

(%gdext.common:defifun ("object_set_script_instance"
                        object-set-script-instance)
                       :void
                       (p-object %gdext.types::object-ptr)
                       (p-script-instance
                        %gdext.types::script-instance-data-ptr))

(%gdext.common:defifun ("callable_custom_create"
                        callable-custom-create)
                       :void
                       (r-callable
                        %gdext.types::uninitialized-type-ptr)
                       (p-callable-custom-info
                        (:pointer
                         %gdext.types::callable-custom-info)))

(%gdext.common:defifun ("callable_custom_create2"
                        callable-custom-create2)
                       :void
                       (r-callable
                        %gdext.types::uninitialized-type-ptr)
                       (p-callable-custom-info
                        (:pointer
                         %gdext.types::callable-custom-info2)))

(%gdext.common:defifun ("callable_custom_get_userdata"
                        callable-custom-get-userdata)
                       (:pointer :void)
                       (p-callable %gdext.types::const-type-ptr)
                       (p-token (:pointer :void)))

(%gdext.common:defifun ("classdb_construct_object"
                        classdb-construct-object)
                       %gdext.types::object-ptr
                       (p-classname
                        %gdext.types::const-string-name-ptr))

(%gdext.common:defifun ("classdb_construct_object2"
                        classdb-construct-object2)
                       %gdext.types::object-ptr
                       (p-classname
                        %gdext.types::const-string-name-ptr))

(%gdext.common:defifun ("classdb_get_method_bind"
                        classdb-get-method-bind)
                       %gdext.types::method-bind-ptr
                       (p-classname
                        %gdext.types::const-string-name-ptr)
                       (p-methodname
                        %gdext.types::const-string-name-ptr)
                       (p-hash %gdext.types::int))

(%gdext.common:defifun ("classdb_get_class_tag"
                        classdb-get-class-tag)
                       (:pointer :void)
                       (p-classname
                        %gdext.types::const-string-name-ptr))

(%gdext.common:defifun ("classdb_register_extension_class"
                        classdb-register-extension-class)
                       :void
                       (p-library %gdext.types::class-library-ptr)
                       (p-class-name
                        %gdext.types::const-string-name-ptr)
                       (p-parent-class-name
                        %gdext.types::const-string-name-ptr)
                       (p-extension-funcs
                        (:pointer %gdext.types::class-creation-info)))

(%gdext.common:defifun ("classdb_register_extension_class2"
                        classdb-register-extension-class2)
                       :void
                       (p-library %gdext.types::class-library-ptr)
                       (p-class-name
                        %gdext.types::const-string-name-ptr)
                       (p-parent-class-name
                        %gdext.types::const-string-name-ptr)
                       (p-extension-funcs
                        (:pointer
                         %gdext.types::class-creation-info2)))

(%gdext.common:defifun ("classdb_register_extension_class3"
                        classdb-register-extension-class3)
                       :void
                       (p-library %gdext.types::class-library-ptr)
                       (p-class-name
                        %gdext.types::const-string-name-ptr)
                       (p-parent-class-name
                        %gdext.types::const-string-name-ptr)
                       (p-extension-funcs
                        (:pointer
                         %gdext.types::class-creation-info3)))

(%gdext.common:defifun ("classdb_register_extension_class4"
                        classdb-register-extension-class4)
                       :void
                       (p-library %gdext.types::class-library-ptr)
                       (p-class-name
                        %gdext.types::const-string-name-ptr)
                       (p-parent-class-name
                        %gdext.types::const-string-name-ptr)
                       (p-extension-funcs
                        (:pointer
                         %gdext.types::class-creation-info4)))

(%gdext.common:defifun ("classdb_register_extension_class5"
                        classdb-register-extension-class5)
                       :void
                       (p-library %gdext.types::class-library-ptr)
                       (p-class-name
                        %gdext.types::const-string-name-ptr)
                       (p-parent-class-name
                        %gdext.types::const-string-name-ptr)
                       (p-extension-funcs
                        (:pointer
                         %gdext.types::class-creation-info5)))

(%gdext.common:defifun ("classdb_register_extension_class_method"
                        classdb-register-extension-class-method)
                       :void
                       (p-library %gdext.types::class-library-ptr)
                       (p-class-name
                        %gdext.types::const-string-name-ptr)
                       (p-method-info
                        (:pointer %gdext.types::class-method-info)))

(%gdext.common:defifun ("classdb_register_extension_class_virtual_method"
                        classdb-register-extension-class-virtual-method)
                       :void
                       (p-library %gdext.types::class-library-ptr)
                       (p-class-name
                        %gdext.types::const-string-name-ptr)
                       (p-method-info
                        (:pointer
                         %gdext.types::class-virtual-method-info)))

(%gdext.common:defifun ("classdb_register_extension_class_integer_constant"
                        classdb-register-extension-class-integer-constant)
                       :void
                       (p-library %gdext.types::class-library-ptr)
                       (p-class-name
                        %gdext.types::const-string-name-ptr)
                       (p-enum-name
                        %gdext.types::const-string-name-ptr)
                       (p-constant-name
                        %gdext.types::const-string-name-ptr)
                       (p-constant-value %gdext.types::int)
                       (p-is-bitfield %gdext.types::bool))

(%gdext.common:defifun ("classdb_register_extension_class_property"
                        classdb-register-extension-class-property)
                       :void
                       (p-library %gdext.types::class-library-ptr)
                       (p-class-name
                        %gdext.types::const-string-name-ptr)
                       (p-info
                        (:pointer %gdext.types::property-info))
                       (p-setter %gdext.types::const-string-name-ptr)
                       (p-getter %gdext.types::const-string-name-ptr))

(%gdext.common:defifun ("classdb_register_extension_class_property_indexed"
                        classdb-register-extension-class-property-indexed)
                       :void
                       (p-library %gdext.types::class-library-ptr)
                       (p-class-name
                        %gdext.types::const-string-name-ptr)
                       (p-info
                        (:pointer %gdext.types::property-info))
                       (p-setter %gdext.types::const-string-name-ptr)
                       (p-getter %gdext.types::const-string-name-ptr)
                       (p-index %gdext.types::int))

(%gdext.common:defifun ("classdb_register_extension_class_property_group"
                        classdb-register-extension-class-property-group)
                       :void
                       (p-library %gdext.types::class-library-ptr)
                       (p-class-name
                        %gdext.types::const-string-name-ptr)
                       (p-group-name %gdext.types::const-string-ptr)
                       (p-prefix %gdext.types::const-string-ptr))

(%gdext.common:defifun ("classdb_register_extension_class_property_subgroup"
                        classdb-register-extension-class-property-subgroup)
                       :void
                       (p-library %gdext.types::class-library-ptr)
                       (p-class-name
                        %gdext.types::const-string-name-ptr)
                       (p-subgroup-name
                        %gdext.types::const-string-ptr)
                       (p-prefix %gdext.types::const-string-ptr))

(%gdext.common:defifun ("classdb_register_extension_class_signal"
                        classdb-register-extension-class-signal)
                       :void
                       (p-library %gdext.types::class-library-ptr)
                       (p-class-name
                        %gdext.types::const-string-name-ptr)
                       (p-signal-name
                        %gdext.types::const-string-name-ptr)
                       (p-argument-info
                        (:pointer %gdext.types::property-info))
                       (p-argument-count %gdext.types::int))

(%gdext.common:defifun ("classdb_unregister_extension_class"
                        classdb-unregister-extension-class)
                       :void
                       (p-library %gdext.types::class-library-ptr)
                       (p-class-name
                        %gdext.types::const-string-name-ptr))

(%gdext.common:defifun ("get_library_path" get-library-path)
                       :void
                       (p-library %gdext.types::class-library-ptr)
                       (r-path
                        %gdext.types::uninitialized-string-ptr))

(%gdext.common:defifun ("editor_add_plugin" editor-add-plugin)
                       :void
                       (p-class-name
                        %gdext.types::const-string-name-ptr))

(%gdext.common:defifun ("editor_remove_plugin" editor-remove-plugin)
                       :void
                       (p-class-name
                        %gdext.types::const-string-name-ptr))

(%gdext.common:defifun ("editor_help_load_xml_from_utf8_chars"
                        editor-help-load-xml-from-utf8-chars)
                       :void
                       (p-data (:pointer :char)))

(%gdext.common:defifun ("editor_help_load_xml_from_utf8_chars_and_len"
                        editor-help-load-xml-from-utf8-chars-and-len)
                       :void
                       (p-data (:pointer :char))
                       (p-size %gdext.types::int))

(%gdext.common:defifun ("editor_register_get_classes_used_callback"
                        editor-register-get-classes-used-callback)
                       :void
                       (p-library %gdext.types::class-library-ptr)
                       (p-callback
                        %gdext.types::editor-get-classes-used-callback))

(%gdext.common:defifun ("register_main_loop_callbacks"
                        register-main-loop-callbacks)
                       :void
                       (p-library %gdext.types::class-library-ptr)
                       (p-callbacks
                        (:pointer %gdext.types::main-loop-callbacks)))

(export '(get-godot-version get-godot-version2 mem-alloc mem-realloc
          mem-free mem-alloc2 mem-realloc2 mem-free2 print-error
          print-error-with-message print-warning
          print-warning-with-message print-script-error
          print-script-error-with-message get-native-struct-size
          variant-new-copy variant-new-nil variant-destroy
          variant-call variant-call-static variant-evaluate
          variant-set variant-set-named variant-set-keyed
          variant-set-indexed variant-get variant-get-named
          variant-get-keyed variant-get-indexed variant-iter-init
          variant-iter-next variant-iter-get variant-hash
          variant-recursive-hash variant-hash-compare
          variant-booleanize variant-duplicate variant-stringify
          variant-get-type variant-has-method variant-has-member
          variant-has-key variant-get-object-instance-id
          variant-get-type-name variant-can-convert
          variant-can-convert-strict
          get-variant-from-type-constructor
          get-variant-to-type-constructor
          variant-get-ptr-internal-getter
          variant-get-ptr-operator-evaluator
          variant-get-ptr-builtin-method variant-get-ptr-constructor
          variant-get-ptr-destructor variant-construct
          variant-get-ptr-setter variant-get-ptr-getter
          variant-get-ptr-indexed-setter
          variant-get-ptr-indexed-getter variant-get-ptr-keyed-setter
          variant-get-ptr-keyed-getter variant-get-ptr-keyed-checker
          variant-get-constant-value variant-get-ptr-utility-function
          string-new-with-latin1-chars string-new-with-utf8-chars
          string-new-with-utf16-chars string-new-with-utf32-chars
          string-new-with-wide-chars
          string-new-with-latin1-chars-and-len
          string-new-with-utf8-chars-and-len
          string-new-with-utf8-chars-and-len2
          string-new-with-utf16-chars-and-len
          string-new-with-utf16-chars-and-len2
          string-new-with-utf32-chars-and-len
          string-new-with-wide-chars-and-len string-to-latin1-chars
          string-to-utf8-chars string-to-utf16-chars
          string-to-utf32-chars string-to-wide-chars
          string-operator-index string-operator-index-const
          string-operator-plus-eq-string string-operator-plus-eq-char
          string-operator-plus-eq-cstr string-operator-plus-eq-wcstr
          string-operator-plus-eq-c32str string-resize
          string-name-new-with-latin1-chars
          string-name-new-with-utf8-chars
          string-name-new-with-utf8-chars-and-len
          xml-parser-open-buffer file-access-store-buffer
          file-access-get-buffer image-ptrw image-ptr
          worker-thread-pool-add-native-group-task
          worker-thread-pool-add-native-task
          packed-byte-array-operator-index
          packed-byte-array-operator-index-const
          packed-float32-array-operator-index
          packed-float32-array-operator-index-const
          packed-float64-array-operator-index
          packed-float64-array-operator-index-const
          packed-int32-array-operator-index
          packed-int32-array-operator-index-const
          packed-int64-array-operator-index
          packed-int64-array-operator-index-const
          packed-string-array-operator-index
          packed-string-array-operator-index-const
          packed-vector2-array-operator-index
          packed-vector2-array-operator-index-const
          packed-vector3-array-operator-index
          packed-vector3-array-operator-index-const
          packed-vector4-array-operator-index
          packed-vector4-array-operator-index-const
          packed-color-array-operator-index
          packed-color-array-operator-index-const
          array-operator-index array-operator-index-const array-ref
          array-set-typed dictionary-operator-index
          dictionary-operator-index-const dictionary-set-typed
          object-method-bind-call object-method-bind-ptrcall
          object-destroy global-get-singleton
          object-get-instance-binding object-set-instance-binding
          object-free-instance-binding object-set-instance
          object-get-class-name object-cast-to
          object-get-instance-from-id object-get-instance-id
          object-has-script-method object-call-script-method
          ref-get-object ref-set-object script-instance-create
          script-instance-create2 script-instance-create3
          placeholder-script-instance-create
          placeholder-script-instance-update
          object-get-script-instance object-set-script-instance
          callable-custom-create callable-custom-create2
          callable-custom-get-userdata classdb-construct-object
          classdb-construct-object2 classdb-get-method-bind
          classdb-get-class-tag classdb-register-extension-class
          classdb-register-extension-class2
          classdb-register-extension-class3
          classdb-register-extension-class4
          classdb-register-extension-class5
          classdb-register-extension-class-method
          classdb-register-extension-class-virtual-method
          classdb-register-extension-class-integer-constant
          classdb-register-extension-class-property
          classdb-register-extension-class-property-indexed
          classdb-register-extension-class-property-group
          classdb-register-extension-class-property-subgroup
          classdb-register-extension-class-signal
          classdb-unregister-extension-class get-library-path
          editor-add-plugin editor-remove-plugin
          editor-help-load-xml-from-utf8-chars
          editor-help-load-xml-from-utf8-chars-and-len
          editor-register-get-classes-used-callback
          register-main-loop-callbacks))