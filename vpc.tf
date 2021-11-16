# 메인 VPC 인스턴스
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "my-vpc-101"
  }
}

# 퍼블릭 서브넷
# 위와 동일한 IP, 하지만 CIDR 상의 마스크는 줄인다
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    "Name" = "my-vpc-101-public-subnet"
  }
}

# 프라이빗 서브넷
# 퍼블릭 서브넷과 다른 IP를 사용한다
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    "Name" = "my-vpc-101-private-subnet"
  }
}

# NAT 전용 탄력IP
resource "aws_eip" "eip-nat-101" {
  vpc = true

  lifecycle {
    create_before_destroy = true
  }
}

# 인터넷 게이트웨이
resource "aws_internet_gateway" "igw-101" {
  vpc_id = aws_vpc.main.id

  tags = {
    "Name" = "my-vpc-101-igw"
  }
}

/* 
# NAT 게이트웨이
# 위에서 선언한 탄력IP를 allocation_id에 정의한다
# [주의] 시간당 과금 대상이다! (실습 용도로 NAT를 사용할 때에만 주석 풀어서 재반영할 것)
resource "aws_nat_gateway" "nat-gw-101" {
  allocation_id = aws_eip.eip-nat-101.id

  subnet_id = aws_subnet.public_subnet.id

  tags = {
    "Name" = "my-vpc-101-nat-gw"
  }
}
 */
