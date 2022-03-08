class wordpress::db {
        
    class { '::mysql::server':

        # Set the root password
        root_password => $wordpress::conf::root_password,

        # Create the database
        databases => {
            "${wordpress::conf::db_name}" => {
                ensure => 'present',
                charset => 'utf8'
            }
        },

        # Create the user
        users => {
            "${wordpress::conf::db_user_host}" => {
                ensure => present,
                password_hash => mysql_password("${wordpress::conf::db_user_password}")
            }
        },

        # Grant privileges to the user
        grants => {
            "${wordpress::conf::db_user_host_db}" => {
                ensure     => 'present',
                options    => ['GRANT'],
                privileges => ['ALL'],
                table      => "${wordpress::conf::db_name}.*",
                user       => "${wordpress::conf::db_user_host}",
            }
        },
    }

    # Install MySQL client and all bindings
    class { '::mysql::client':
        require => Class['::mysql::server'],
        bindings_enable => true

 Now checking for git change sinc to local
 this i am editing in branch new    }
}



