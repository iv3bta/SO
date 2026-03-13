if [[$# -ne 1]]; then
	echo "usage: $0 <nume_proiect>" >$2
fi

validate_project() {
	local name="1"
	if [[ ! "$name" =~ ^[a-zA-Z0-9_-]+$]]; then
		echo "[ERROR] numele trebuie sa contina doar litere, cifre, '-', '_'" >&2
		return 1
	fi	
}

