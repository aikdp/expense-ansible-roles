variable "instances"{
    type = map
    default = {
        nginx-1 = "t3.micro"
        nginx-2 = "t3.micro"
    }
}

