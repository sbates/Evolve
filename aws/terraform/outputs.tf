output "sg" {
    value = "${aws_security_group.evolve.id}"
}

output "keypair" {
    value = "${aws_key_pair.evolve.id}"
}