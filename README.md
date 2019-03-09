# Next Generation Networks(Baby)
## Descript
これはictsc2018で `Next Generation Networks(Baby)` と第して出題した問題を体験できるconfigとvagrantfileです。
SFCの具体的なコンフィグ例を体験することができます。

This is a config and vagrantfile that you can experience the problem that I first tried with `Next Generation Network(Baby)` on ICTSC2018. You can experience concrete configuration example of SFC.

## usage
### 初期化
`bento/ubuntu-18.04` を`vagrant up`して, `config/setup.sh` をsudo権限で実行します。
それが完了したあと、`ictsc_SRT` という名前でbox化します。

You will do `vagrant up`(use image:`bento/ubuntu-18.04`), and sudo run `config/setup.sh`.After completion, we create a box with the name `ictsc_SRT`

### 実行
前述したものを実行したあとに同梱されたvagrantfileを `vagrant up`をして実行します

After doing the above, do `vagrant up` with the vagrantfile.

### 問題を解くためには。
まずはじめにhostAからhostBへの疎通を確認します。そのうえでコンフィグを変更をします。
具体的にはRouter1, Router5からネームスペースを区切っているSnortのノードを変更することになります。

First of all, confirm the communication from host A to host B. Then change the config.
Specifically, we will change Snort Node that separates the namespace from Router 1, Router 5.

```
# Router1
ip route add 10.0.1.0/24 encap seg6 mode encap segs fc00:3::bb,fc00:5::bb,fc00:4::bb dev eth1
ip -6 route add fc00:1::bb/128 encap seg6local action End.DX4 nh4 10.0.0.1 dev eth2

# Router5(SnortMode Side)
depmod -a && modprobe srext
sudo srconf localsid add fc00:5::bb end.ad4 ip 192.168.1.2 veth0 veth1
```

これでサービスチェインをして通信を確認できます。
You can now check the communication by doing a service chain. Thanks!!
## toplo

![image](https://github.com/takehaya/SRv6_SFC_Example/blob/master/SRT_toplo.001.png)
