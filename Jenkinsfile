pipeline {
    agent any

  stages {

     stage("Initial cleanup") {
          steps {
            dir("${WORKSPACE}") {
              deleteDir()
            }
          }
        }

    stage('Checkout SCM') {
      steps {
            git branch: 'main', url: 'https://github.com/nbomasi/php-todo.git'
      }
    }

    stage('Prepare Dependencies') {
      steps {
             sh 'mv .env.sample .env'
             sh 'sudo apt update'
             sh 'sudo apt install curl -y' 
             sh 'udo apt install php-cli -y' 
             sh 'udo apt install php-zip unzip -y'
             sh 'curl -sS https://getcomposer.org/installer -o composer-setup.php'
             sh 'php composer-setup.php --install-dir=/usr/local/bin --filename=composer'
             //sh 'composer install'
             sh 'php artisan migrate'
             sh 'php artisan db:seed'
             sh 'php artisan key:generate'
      }
    }
  }
}