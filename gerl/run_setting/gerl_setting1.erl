%% @author dzR <dizengrong@gmail.com>
%% @doc 1服的有关系统的一些设置

-module (gerl_setting1).
-compile([export_all]).

%% 服务器(即几服，从1开始编号)
get(server_index) -> 1;

%% 数据库配置
get(db_conn) -> gerl_mysql_conn;
get(db_host) -> "127.0.0.1";
get(db_port) -> 3306;
get(db_user) -> "root";
get(db_pass) -> "123456";
get(db_name) -> "gerl_db" ++ erlang:integer_to_list(?MODULE:get(server_index));
get(db_encode) -> utf8;

%% 网关配置
get(gateway_num_of_acceptor) -> 10;
get(gateway_port) -> 5555;

%% 节点上会启动哪些app
get({start_apps, 'gerl1_1@127.0.0.1'}) -> 
	[gerl_gateway, gerl_chat, gerl_cache, gerl_center_srv, gerl_map_srv];

%% 地图是在哪个节点上创建的配置:{map_node, 地图id}
get({map_node, 10000}) -> 'gerl1_1@127.0.0.1';
get({map_node, _}) -> 'gerl1_1@127.0.0.1';

get(Key) -> erlang:throw({?MODULE, error_confg, 'get/1', Key}).