#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <stdbool.h>
#include <pthread.h>
#include <sys/wait.h>

#define current_layout_path "/home/LiamUSR/programs/c-cpp/layout/current_layout.txt"

typedef struct {
	char *bash;
	char **args;
} thread_args;

void* exec_cmd(void *arg){
	thread_args *args_struct = (thread_args *)arg;
	pid_t pid = fork();
	
	if (pid == 0) {
		/* In child process */
		execvp(args_struct->bash, args_struct->args);
		perror("execvp failed");
		exit(1);
	} else if (pid > 0) {
		/* In parent thread */
		printf("Spawned child with PID %d\n", pid);
		waitpid(pid, NULL, 0);
	} else {
		perror("fork failed");}
	return NULL;
}

void set_layout(char number, unsigned int layout_size){
	FILE *fptr = fopen(current_layout_path, "w");
	char *options = "-option caps:escape";
	char *args[layout_size];
	char *bash = "/bin/bash";
	unsigned int index = 0;
	
	args[index++] = bash;
	args[index++] = "-c";

	if (number == '1'){
		args[index++] = ("setxkbmap -layout us");
		fprintf(fptr, "US");
		printf("Set US Layout\n");
	}
	else if (number == '2'){
		args[index++] = ("setxkbmap -layout us -variant dvorak");
		fprintf(fptr, "Dvorak");
		printf("Set Dvorak Layout");
	}
	else if (number == '3'){
		args[index++] = ("setxkbmap -layout fr -variant bepo");
		fprintf(fptr, "Bepo");
		printf("Set Bepo Layout");
	}
	else if (number == '4'){
		args[index++] = ("setxkbmap -layout ru -variant phonetic");
		fprintf(fptr, "Russian");
		printf("Set Russian Layout");
	}
	args[index++] = options;
	args[index] = NULL;

	fclose(fptr);

	thread_args *t_args = malloc(sizeof(thread_args));
	t_args->bash = bash;
	t_args->args = args;

	pthread_t thread_id;
	pthread_create(&thread_id, NULL, exec_cmd, t_args);
	pthread_join(thread_id, NULL);

}
int main(int argc, char *argv[]){
	FILE *fptr = fopen(current_layout_path, "r");

	/* argv definitions, 1 = qwerty, 2 = dvorak, 3 = bepo, 4 = ru*/
	char layouts[5] = {'1', '2', '3', '4', '\0'};
	char number;
	if (argc >= 3){
		printf("Too many arguments");
		exit(1);
	}
	if (argc == 2){
		for(int i = 0; i < sizeof(layouts); i++){
			if (argv[1][0] == layouts[i]){
				number = layouts[i];
				printf("Argument Passed, number char is %c\n", number);
				set_layout(number, sizeof(layouts) / sizeof(layouts[0]));
			}
		}
	}
	else{
		printf("Not enough arguments / Valid Arguments\n");
		exit(1);
	}
	if (fptr == NULL){
		printf("Can't open layout file\n");
		exit(1);
	}
	char *contents = malloc(sizeof(char));
	unsigned int content_size = 0;
	char c;
	while ((c = fgetc(fptr)) != EOF){
		content_size++;
		contents = realloc(contents, sizeof(char) * (content_size + 1));
		contents[content_size -1] = c;
	}
	printf("%s", contents);

	free(contents);

	fclose(fptr);
	return 0;
}
