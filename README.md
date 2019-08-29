# phoenix_liveview_demo_env_01
技術書典7向け。

Phoenix LiveViewのデモ（example）を動かすための環境をDockerで用意する。

## 操作手順

 * cd proj
 * git clone https://github.com/chrismccord/phoenix_live_view_example.git
 * cd phoenix_live_view_example
 * config/dev.exsの修正: hostnameを「postgres_host」に修正
 * mix.lockの修正: tzdataのバージョンを「:hex, :tzdata, "1.0.1"」に修正
 * cd ../../
 * docker-compose up -d
 * docker ps でPostgreSQLだけ動いていることを確認
 * docker-compose run --service-ports web bash
 * コンテナ内の処理: cd phoenix_live_view_example/
 * コンテナ内の処理: mix deps.get 
 * コンテナ内の処理: mix ecto.create && mix ecto.migrate
 * コンテナ内の処理: npm install --prefix assets
 * コンテナ内の処理: iex -S mix phx.server
 
Phoenixが起動したら、以下のURLにアクセスする。

<localhost:4000>

## 補足

 * DEMOコードを再開しやすいように、ソースコードやPostgreSQLのデータは永続化している。
 * 停止時は、docker-compose down を利用する。 
 * 再開時、docker-compose upのあとで、docker-compose runでシェルスクリプトを実行する。
   * docker-compose up -d
   * docker-compose run --service-ports web bash liveview.sh
