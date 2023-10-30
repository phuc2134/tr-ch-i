#include <iostream>
#include <vector>

using namespace std;

const int ROWS = 6;
const int COLS = 5;

int maze[ROWS][COLS] = {
    {2, 3, 16, 56, 87},
    {100, 101, 66, 543, 200},
    {150, 154, 178, 76, 54},
    {43, 27, 4, 2, 1},
    {14, 12, 17, 3, 16},
    {22, 91, 23, 4, 56}
};

bool visited[ROWS][COLS] = {false};

int dx[4] = {0, 0, -1, 1};
int dy[4] = {-1, 1, 0, 0};

bool isValid(int x, int y) {
    return x >= 0 && x < ROWS && y >= 0 && y < COLS && !visited[x][y];
}

int dfs(int x, int y) {
    visited[x][y] = true;
    int maxVal = 0;
    int maxIndex = -1;
    for (int i = 0; i < 4; i++) {
        int nx = x + dx[i];
        int ny = y + dy[i];
        if (isValid(nx, ny) && maze[nx][ny] > maxVal) {
            maxVal = maze[nx][ny];
            maxIndex = i;
        }
    }
    if (maxIndex == -1) {
        return maze[x][y];
    }
    int nx = x + dx[maxIndex];
    int ny = y + dy[maxIndex];
    return maze[x][y] + dfs(nx, ny);
}

int main() {
    int x, y;
    cout << "Enter starting position (x, y): ";
    cin >> x >> y;
    int score = dfs(x, y);
    cout << "Score: " << score << endl;
    return 0;
}
