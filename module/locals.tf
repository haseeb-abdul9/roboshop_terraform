locals {
  Name = var.env!=""? "${var.component_name}-${var.env}" : var.component_name
  db_commands = [
    "rm -rf roboshop_shell",
    "git clone https://github.com/haseeb-abdul9/roboshop_shell.git",
    "cd roboshop_shell",
    "sudo bash ${var.component_name}.sh ${var.password}"
  ]
  app_commands = [
    "sudo labauto ansible",
    "ansible-pull -i localhost, -U https://github.com/haseeb-abdul9/roboshop_ansible.git roboshop.yml -e env=${var.env} -e role_name=${var.component_name}"
  ]
  db_tags = {
    Name = "${var.component_name}-${var.env}"
  }
  app_tags = {
    Name = "${var.component_name}-${var.env}"
    Monitor = "true"
    component = var.component_name
    env = var.env
  }
}