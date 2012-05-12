Ruby As You Talk
================

Rayt allows you to easily write Ruby that sounds as you talk. As a picture is worth thousand words, here is an example :

    require "rayt"
    require "some_library"
    
    Rayt.define.add_access_to(:resource).for_the_user(:user) do |args|
      args.user.add_access(args.resource)
    end
    
    res = Resource.first
    tom = User.find_by_name("Tom")
    john = User.find_by_name("John")
    
    Rayt.add_access_to(res).for_the_user(tom)
    Rayt.add_access_to(res).for_the_user(john)

Running tests
-------------

To run the specs, just user the followings :

    gem install bundler
    bundle install
    rake spec
