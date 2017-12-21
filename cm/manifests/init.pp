class cm(
 ) inherits ::cm::params {
    class {'::cm::repo': }
    -> class {'::cm::server':}
    -> class {'::cm::agent':}
    -> class {'::cm::add-spark.pp'}
    -> class {'::cm::cluster_template'}
    # If cluster should have security comment the above class {'::cm::cluster_template'} adn uncomment the below one 
    #-> class {'::cm::kerberized_cluster_template'}
}
