import java.text.ParseException;

public class fcfs {
    static void findwaitingtime(int process[], int n, int wt[], int bt[]) {
        wt[0] = 0;
        for (int i = 1; i < n; i++) {
            wt[i] = bt[i - 1] + wt[i - 1];
        }
    }

    static void findturnaroundtime(int process[], int n, int bt[], int wt[], int tat[]) {
        for (int i = 0; i < n; i++) {
            tat[i] = bt[i] + wt[i];
        }
    }

    static void findavgtime(int process[], int n, int bt[]) {
        int wt[] = new int[n], tat[] = new int[n];
        int total_wt = 0, total_tat = 0;

        findwaitingtime(process, n, wt, bt);
        findturnaroundtime(process, n, bt, wt, tat);
        System.out.println("Proc\tBurst Time\tWaiting Time\tTurn Around Time");

        for (int i = 0; i < n; i++) {
            total_wt += wt[i];
            total_tat += tat[i];
            System.out.printf("%d\t%d\t\t%d\t\t%d\n", process[i], bt[i], wt[i], tat[i]);
        }

        float avg_wt = (float) total_wt / n;
        float avg_tat = (float) total_tat / n;

        System.out.printf("Avg waiting time = %.2f\n", avg_wt);
        System.out.printf("Avg turn around time = %.2f\n", avg_tat);
    }

    public static void main(String[] args) throws ParseException {
        int process[] = {1, 2, 3};
        int n = process.length;
        int burst_time[] = {10, 5, 8};

        findavgtime(process, n, burst_time);
    }
}
