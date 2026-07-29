# 💣 [CRITICAL] 22번 SSH 포트를 전 세계(0.0.0.0/0)에 완전 오픈
resource "aws_security_group" "nuclear_sg" {
  name        = "allow-ssh-from-entire-world"
  description = "Open SSH to world"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # ← 전 세계 누구나 SSH 접속 가능 (100% 빌드 킬)
  }
}

# 💣 [CRITICAL] 인터넷에 그대로 노출된 RDS 데이터베이스
resource "aws_db_instance" "nuclear_db" {
  allocated_storage   = 10
  engine              = "mysql"
  instance_class      = "db.t3.micro"
  publicly_accessible = true # ← 데이터베이스 퍼블릭 노출 (100% 빌드 킬)
  skip_final_snapshot = true
}
