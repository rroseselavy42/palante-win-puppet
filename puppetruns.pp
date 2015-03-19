# Class: puppetruns
#this class when run will schedule
#puppet and then stop puppet from running!
class puppetruns {
    # first put puppet in scheduler
    #login and log out
    scheduled_task {'puppetlogin'
        ensure => present,
        enabled => true,
        command => ''}
}