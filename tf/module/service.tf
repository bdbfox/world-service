data "template_file" "service_task_definition" {
  template = "${file("./template.json")}"

  vars {
    cpu            = 1024
    port           = 3000
    deploy_tag     = "${var.deploy_tag}"
    docker_image   = "${var.docker_image}"
    docker_tag     = "${var.docker_tag}"
    redis_host     = "${data.terraform_remote_state.data_storage.redis_host}"
    service_name   = "${var.service_name}"
    version        = "${var.version}"
  }
}

resource "aws_ecs_task_definition" "service_definition" {
  family                = "${var.env_name}_${var.deploy_tag}_${var.service_name}_${var.version}"
  network_mode          = "bridge"
  container_definitions = "${data.template_file.service_task_definition.rendered}"
}

resource "aws_ecs_service" "service_server" {
  name            = "${var.deploy_tag}_${var.service_name}_${var.version}"
  cluster         = "${data.terraform_remote_state.service_cluster.cluster_name}"
  task_definition = "${aws_ecs_task_definition.service_definition.arn}"
  # change these as desired
  desired_count   = 2
  deployment_minimum_healthy_percent = 40
}
