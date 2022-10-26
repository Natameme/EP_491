#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <string.h>
#include <unistd.h>

//to COMPILE AND RUN:
// clang SPEARreader.c -o SPEARreader && ./SPEARreader
const char* filename = "PianoC0.txt";
const char* sheetname = "PianoC0.csv";

int main(int argc, char *argv[])
{
    FILE *in_file = fopen(filename, "r");
    if (!in_file)
    {
        perror("fopen");
        return 0;
    }

    FILE *out_file = fopen(sheetname, "w");
    if (!out_file)
    {
      perror("fopen");
      return 0;
    }
    struct stat sb;
    if (stat(filename, &sb) == -1)
    {
        perror("stat");
        return 0;
    }

    char *thisWord = malloc(sb.st_size);
    char *lastWord = malloc(sb.st_size);

    char parCount[32];
    int  numPartials;
    int  numBreakPoints = 1;
    char parValue[8];
    char breakValue[8];

    int   thisPartial = 0;
    float    freq[1024];//frequency per partial
    float parFreq[4096]; //frequency per breakpoint to avg
    float    amps[1024]; //amplitude per partial
    float    durs[1024]; //duration  per partial



    while (fscanf(in_file, "%s", thisWord) != EOF) {
      //print lastword and thisword
    //  printf("lastWord: %s \n", lastWord);
    //  printf("thisWord: %s \n\n", thisWord);

      // get number of partials
      if(strcmp("partials-count",lastWord) == 0){
          strcpy(parCount, thisWord);
          numPartials = atoi(parCount);
          printf("numPartials: %i \n", numPartials);
      }

      if(strcmp("partials-data",thisWord) == 0){
          strcpy(lastWord,thisWord);
          break;
      }

      //sleep(1); //for testing
      strcpy(lastWord,thisWord);
    }
    /////////////////////////////////
    printf("End of First Loop \n\n");
    /////////////////////////////////
  char  ampValue[32];
  char  durValue[32];
  char  freqValue[32];
  int   parIndex = 0;
  int   breakIndex = 0;
  int   ampIndex = 0;
  int   durIndex = 0;
  int   freqIndex = 0;
  int   i = 0;


    while (fscanf(in_file, "%s", thisWord) != EOF) {
      if(strlen(lastWord) <= 5 && strlen(thisWord) <= 5 && atoi(lastWord) == thisPartial + 1 ){
        // NEW PARTIAL
        // reinitialize function indeces
        parIndex = 0;
        breakIndex = 0;
        ampIndex = 0;
        durIndex = 0;
        i = 0;
        // copy lastWord to thisPartial and thisWord to numBreakPoints
        strcpy(parValue, lastWord);
        strcpy(breakValue, thisWord);
        thisPartial = atoi(parValue);
        numBreakPoints = atoi(breakValue);

        i = 0;//reinitialize index
        printf("thisPartial %i numBreakPoints: %i \n", thisPartial, numBreakPoints);//print breakpoints
        printf("breakIndex: %i\n", breakIndex);
        breakIndex = 1;


        //spit error if too many partials
        if(numBreakPoints >= 2048){
          printf("ERROR: Number of Breakpoints Exceeds 2048");
          return 2;
        }

      }


      if(strcmp(lastWord, breakValue) == 0 && strcmp(thisWord, breakValue) != 0 && breakIndex == 1){
        //printf("lastWord: %s \n", lastWord);
        strcpy(ampValue, thisWord);
        amps[thisPartial] = atof(ampValue);
        printf("amplitude  : %f\n", amps[thisPartial]);
      //  printf("thisWord: %s ampValue: %s \n", thisWord, ampValue);
        ampIndex = 1;
        printf("ampIndex: %i\n", ampIndex);
      }


      if(strcmp(lastWord, ampValue) == 0 && durIndex == 0 && ampIndex == 1){
        strcpy(durValue, thisWord);
        durs[thisPartial] = atof(durValue);
        printf("duration   : %f\n", durs[thisPartial]);
      //  printf("thisWord: %s durValue: %s \n", thisWord, ampValue);
        durIndex = 1;
        printf("durIndex: %i\n\n", durIndex);

    }

    if(durIndex == 1 || freqIndex != 0){
      //printf("parIndex: %i\n", parIndex);
      if(parIndex % 3 == 1 && strlen(thisWord) > 8){

        strcpy(freqValue, thisWord);
        parFreq[i] = atof(freqValue);

        printf("i: %i thisPartial %i frequency: %s  amplitude: %f duration: %f\n", i, thisPartial, thisWord, amps[thisPartial], durs[thisPartial]);//parFreq[i], amps[thisPartial], durs[thisPartial]);
        i++;
      }
        parIndex++;
        freqIndex = 1;
    }

      if(numPartials > 1024){
        printf("ERROR: Number of Partials Exceeds 1024");
        return 1;
      }


      if(atoi(thisWord) == thisPartial + 1 && strcmp(lastWord, "0.000000") == 0){
        ///////////////////////////////////////////////////////
        // Average Frequency For the Previous Partial
        float sum;
        float avgFreq;
          // take the average
          for(int j = 0; j < numBreakPoints; j++){
          //printf("freq of %i: %f\n", j, parFreq[j]);
            sum += parFreq[j];
          }
          avgFreq = sum / (float)numBreakPoints;
          freq[thisPartial] = avgFreq;
          printf("Avg Frequency: %f \n\n", freq[thisPartial]);

          //reinitialize values
          sum = 0;
          avgFreq = 0;
          printf("breakIndex: %i, ampIndex: %i durIndex: %i\n", breakIndex, ampIndex, durIndex);
          //////////////////////////////////////////////////////////////////////////////////////
          //////////////////////////////////////////////////////////////////////////////////////
       }

      //store the mode of parFreqs in freq[i]
      //restart the process for the next partial
      //  sleep(1);
      strcpy(lastWord, thisWord);
    }

    // print into csv
    fprintf(out_file, "Partial, Frequency, Amplitude, Duration;\n");
    for(int k = 0; k < numPartials; k++){
      fprintf(out_file, "%i, %f , %f , %f \n", k, freq[k], amps[k], durs[k]);
    }

    fclose(in_file);
    return 0;
}
