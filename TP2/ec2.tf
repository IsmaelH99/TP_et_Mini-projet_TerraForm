provider "aws"{
    region = "us-east-1"
    access_key = "AKIA56SEMSCYSWED2RS2"
    secret_key = "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"
}

resource "aws_instance" "myec2" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    tags = {
        Name = "Groupe-1"
    }
}
