#!/bin/bash

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

echo "############### Starting the Installation ####################"

echo "Unzip the binary file of Oracle XE"
unzip /vagrant/binary/oracle-xe-11.2.0-1.0.x86_64.rpm.zip -d /tmp/ 

echo "############# Defining swap area  ######################"
mkdir -p /swap
cd /swap
dd if=/dev/zero of=/swap/swapfile count=1024 bs=2097152
mkswap /swap/swapfile
swapon /swap/swapfile
echo "/swap/swapfile swap swap defaults 0 0" >> /etc/fstab
echo "############### End setting up Swap   #################################"

echo "Installing Oracle XE"
rpm -ivh  /tmp/Disk1/oracle-xe-11.2.0-1.0.x86_64.rpm > /tmp/OracleXESilentInstall.log
echo "Configuring Oracle XE"
/etc/init.d/oracle-xe configure responseFile=/vagrant/xe.rsp >> /tmp/OracleXEConfiguracaoSilentInstall.log

echo "################ FIM INSTALACAO ################"

###############Start Oracle
# /etc/init.d/oracle-xe start
##################Stop Oracle
# /etc/init.d/oracle-xe stop
############ Desinstalando Oracle XE
# rpm -e oracle-xe

#Connecting at Oracle DB as sysdba
# [set|export] ORACLE_SID=XE
# $ sqlplus "/ as sysdba"
