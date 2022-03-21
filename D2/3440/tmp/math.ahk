; euclidean algorithm
    greatestCommonFactor(a, b) {

        while b
            b := Mod(a|0, a:=b)

        return a
    }


gcd(a, b) {
	if b
		return gcd(b, mod(a, b))
	return a
}