class cm::java {
   exec { 'insatll java':
      command => 'wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.rpm" -O jdk-8u151-linux-x64.rpm && rpm -ivh jdk-8u151-linux-x64.rpm',
      cwd     => '/root/',
      path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
      unless => 'java -version',
      # refreshonly => true,
   }
   #/bin/curl http://download.oracle.com/otn-pub/java/jdk//8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.rpm -o /tmp/jdk-8u151-linux-x64.rpm  -fsSL --max-redirs 5 --cookie gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie
   exec { 'Configuring java':
      command => 'alternatives --set java /usr/java/jdk1.8.0_151/jre/bin/java',
      path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
      # refreshonly => true,
   }
}
