#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <sys/wait.h>

int main(int argc, char *argv[]) 
{
	printf("I'm SHELL process, with PID: %d - Main command is \"man wget|grep -A 8 \"\\--debug\" > output.txt\" \n",(int) getpid());
	int rc= fork();
	if (rc<0) {
		//fork failed
		fprintf(stderr,"---FORK FAILED--- \n");
		exit(1); }
		
	else if (rc==0) {
		printf("I am MAN process, with PID: %d - My command is \"man wget\" \n", (int) getpid());
		int pipefds[2];
		if(pipe(pipefds)==-1) {
			perror("---PIPE FAILED---");
			exit(3);	}
		// proper initialization of pipe() command
		
		int rc2 = fork();
		if (rc2<0) {
		fprintf(stderr,"---FORK FAILED--- \n");
		exit(2); }

		else if (rc2==0)	{
			printf("I am GREP process, with PID: %d - My command is \"grep -A 8 \"\\--debug\" > output.txt\" \n", (int) getpid());
			close(STDOUT_FILENO);
			open("./output.txt",O_CREAT|O_WRONLY|O_TRUNC, S_IRWXU);
			close(STDIN_FILENO);
			dup(pipefds[0]);
			close(pipefds[0]);
			close(pipefds[1]);
			//now exec "grep -A 8 "\--debug" "...
			char *myargs[5];
			myargs[0]=strdup("grep");
			myargs[1]=strdup("-A");
			myargs[2]=strdup("8");
			myargs[3]=strdup("\\--debug");
			myargs[4]=NULL;
			execvp(myargs[0], myargs); 
			//end of 2nd child, end of grep process
			exit(4);
			}
		else {	
			close(STDOUT_FILENO);
			dup(pipefds[1]);
			close(pipefds[1]);
			close(pipefds[0]);
			char *myargs1[3];
			myargs1[0]=strdup("man");
			myargs1[1]=strdup("wget");
			myargs1[2]=NULL;
			execvp(myargs1[0],myargs1);
			//fork parent of rc2, end of man wget process
			exit(5);
			}		
		}
		
	else {
		//parent goes this path (main)
		wait(NULL);
		printf("I am SHELL process with PID: %d - execution is completed, you can find the results in output.txt\n",(int) getpid()); 
		}
		
return 0;
}
		
		
		
		
