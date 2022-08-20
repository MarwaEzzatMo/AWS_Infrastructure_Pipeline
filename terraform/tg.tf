resource "aws_lb_target_group" "tg" {
  name     = "${var.name}-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.network.vpc_id
}


resource "aws_lb_target_group_attachment" "tg_attach" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.bastion.id
  port             = 80
}