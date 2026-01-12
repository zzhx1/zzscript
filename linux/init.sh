#参考文章: https://blog.csdn.net/X_T_S/article/details/110142773
sudo apt-get install ntpdate					//在Ubuntu下更新本地时间
sudo ntpdate time.windows.com
sudo hwclock --localtime --systohc			//将本地时间更新到硬件上
