#!/bin/bash

# Yedeği alınacak veritabanının adı
VTB_AD=${VTB_AD:-${MYSQL_ENV_DB_NAME}}

# Yedeği alınacak veritabanının kullanıcı adı
VTB_KULLANICI=${VTB_KULLANICI:-${MYSQL_ENV_DB_USER}}

# Yedeği alınacak veritabanının parolası
VTB_PAROLA=${VTB_PAROLA:-${MYSQL_ENV_DB_PASS}}

# Yedeği alınacak veritabanının sunucu adı
VTB_SUNUCU=${VTB_SUNUCU:-${MYSQL_ENV_DB_HOST}}

# Yedeği alınacak veritabanına verilecek ad
VTB_YEDEK_AD=${VTB_AD}_`date +"%d%m%Y"`.sql

# Veritabanı Yedeğini oluştur.
mysqldump --user="${VTB_KULLANICI}" --password="${VTB_PAROLA}" --host="${VTB_SUNUCU}"  "${VTB_AD}" > /mysqlyedek/"${VTB_YEDEK_AD}"

# Veritabanı Yedeğini arşivle
sleep 5

gzip /mysqlyedek/${VTB_YEDEK_AD}

echo "${VTB_YEDEK_AD}.gz Başarılı bir şekilde oluşturuldu"

# Veritabanı arşivi listele
sleep 5

ls -l /mysqlyedek/
