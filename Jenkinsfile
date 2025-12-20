pipeline {
  agent any

  environment{
    AWS_REGION = "ap-south-1"
    ECR_REPO   = "442042536417.dkr.ecr.ap-south-1.amazonaws.com/python-ci-cd-demo"
    CLUSTER    = "python-ci-cd-eks"
  }

  stages{

    stage('checkout') {
      steps {
        git credentialsId: 'github-creds',
          url: 'https://github.com/0245amruta/devops-ci-cd-eks-project.git',
          branch: 'main'
      }
    }

    stage('Install Dependencies') {
      steps {
        sh '''
          python3.11 --version
          pip3.11 install --upgrade pip
          pip3.11 install --user -r app/requirements.txt
        '''
      }
    }
    
    stage('Run Tests') {
      steps {
        sh '''
          python3.11 -m pytest
        '''
      }
    }

    stage('Build Docker Image') {
      steps {
        sh '''
          docker build -t $ECR_REPO:$GIT_COMMIT .
        '''
      }
    }

    stage('Push Image to ECR') {
      steps {
        sh '''
          aws ecr get-login-password --region $AWS_REGION | \
          docker login --username AWS --password-stdin $ECR_REPO

          docker push $ECR_REPO:$GIT_COMMIT
        '''
      }
    }

    stage('Deploy to EKS') {
      steps {
        sh '''
          aws eks update-kubeconfig --region $AWS_REGION --name $CLUSTER

          kubectl set image deployment/python-app \
          python-app=$ECR_REPO:$GIT_COMMIT

          kubectl rollout status deployment/python-app
        '''
      }
    }
  }
}
