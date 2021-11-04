 #!/bin/bash
        echo -e "Kurulum yapılıyor..." #iptables kuruluyor. *CentOS*
        echo ""
        echo -e "wget,ipset,nano paketleri yükleniyor..."
        echo ""
        yum -y install ipset nano wget
        rm -f tr.zone
        sudo ipset destroy geoAllowIP$ulke
        wget http://www.ipdeny.com/ipblocks/data/countries/tr.zone #Türkiye için güncel ip data çekiliyor.
        sudo ipset -N geoAllowIP nethash
        cat tr.zone | while read line
        do
                sudo ipset -A geoAllowIP $line
        done
        ipset -A geoAllowIP 88.99.69.0/24
                iptables -A INPUT -s 88.99.69.122 -j ACCEPT #ip whiteliste ekleme. (Almanya)
                iptables -A INPUT -s 94.130.101.43 -j ACCEPT #ip whiteliste ekleme. (Almanya)

                        iptables -A INPUT -s 127.0.0.1 -j ACCEPT #localip whitelist ekleme.
                        iptables -I INPUT -p tcp --dport 443 -j ACCEPT #port whitelist ekleme. (443)

                                ipset save geoAllowIP
                                iptables -A INPUT -m state --state NEW -m set ! --set geoAllowIP src -j DROP
                                iptables-save
                                service iptables save
                                rm -f tr.zone

 #Eğer TR dışına tekrar açmak istiyorsanız iptables -F ve iptables -X yazarak TR dışına açabilirsiniz. -Mhykol 
