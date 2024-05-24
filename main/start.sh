#!/bin/sh

SESSION_NAME="minecraft_main"
SERVICE='mohist-1.20.1-693-server.jar' # サーバーファイルの名前
DIR='/home/mc/mc-servers/main/'

# メモリ割り当て
XMX="6G"
XMS="6G"

cd $DIR
case $1 in
    save-all)
        tmux send-keys -t "$SESSION_NAME" "save-all" C-m
        sleep 30;;
    start)
        echo "Starting $SERVICE..."
        tmux new -d -s "$SESSION_NAME" "java -Xmx${XMX} -Xms${XMS} -jar ${SERVICE} nogui";;
    stop)
        tmux send-keys -t "$SESSION_NAME" "say お知らせ: 30秒後にサーバーを再起動します" C-m
        tmux send-keys -t "$SESSION_NAME" "save-all" C-m
        sleep 30
        tmux send-keys -t "$SESSION_NAME" "stop" C-m
        sleep 120;;
    *)
        echo "Usage: $0 {start|stop|save-all}"
esac

exit
