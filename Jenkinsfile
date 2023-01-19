pipeline {
    agent any
    environment {
        AWS_ACCOUNT_ID="779265151744"
        AWS_DEFAULT_REGION="ap-northeast-1"
        IMAGE_REPO_NAME="nodejs-cicd-automation"
        IMAGE_TAG="latest"
        REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
    }
   
    stages {
        stage('Cloning Git') {
            steps {
                sh "git clone 'https://github.com/snnahar/CI-CD-of-Nodejs-Application.git'"     
            }
        }
        stage('Logging into AWS ECR') {
            steps {
                script {
                sh "aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"
                }
                 
            }
        }
  
    // Building Docker images
    stage('Building image') {
      steps{
        script {
          sh "docker build -t ${IMAGE_REPO_NAME} ."
        }
      }
    }
   
    // Uploading Docker images into AWS ECR
    stage('Pushing to ECR') {
     steps{  
         script {
                sh "docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:$IMAGE_TAG"
                sh "docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}"
         }
        }
      }
    }
}