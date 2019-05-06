/*
    DNS
*/
resource "aws_route53_record" "apache-jira" {
  zone_id = "${var.zone_id}"
  name    = "${var.apache-jira_sub_domain}"
  type    = "CNAME"
  ttl     = 300
  records = ["${var.apache_public_dns}"]
}

resource "aws_route53_record" "apache-confluence" {
  zone_id = "${var.zone_id}"
  name    = "${var.apache-confluence_sub_domain}"
  type    = "CNAME"
  ttl     = 300
  records = ["${var.apache_public_dns}"]
}

resource "aws_route53_record" "jira-confluence" {
  zone_id = "${var.zone_id}"
  name    = "${var.jira-confluence_sub_domain}"
  type    = "CNAME"
  ttl     = 300
  records = ["${var.jiraconfluence_private_dns}"]
}

resource "aws_route53_record" "bastion" {
  zone_id = "${var.zone_id}"
  name    = "${var.bastion_sub_domain}"
  type    = "CNAME"
  ttl     = 300
  records = ["${var.bastion_public_dns}"]
  #depends_on = ["aws_instance.bastion"]
}

resource "aws_route53_record" "elb" {
  #depends_on = ["aws_elb.elb"]
  zone_id = "${var.zone_id}"
  name    = "${var.elb_sub_domain}"
  type    = "A"

  alias {
    name                   = "${var.elb_dns_name}"
    zone_id                = "${var.elb_zone_id}"
    evaluate_target_health = true
  }
}