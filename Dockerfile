FROM ubuntu
LABEL description = "I'm carrying a telegram bot"
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
COPY . .
RUN apt-get update && apt-get install -y git
RUN mkdir -p /var/bot4jenkins
WORKDIR /var/bot4jenkins
RUN git clone https://github.com/Covielli/Intelisys_assignment.git
RUN cd Intelisys_assignment/ && apt-get install -y maven && mvn clean install
ENTRYPOINT cd Intelisys_assignment/ && cd hello_bot/ && mvn  exec:java -Dexec.mainClass="kpi.acts.appz.bot.hellobot.HelloWorldBot" -Dexec.args="5028762713:AAEXwTQ_K0jR-9H6OqgwdS7jmQhKs63Xm7s bot4jenkins";
EXPOSE 80
