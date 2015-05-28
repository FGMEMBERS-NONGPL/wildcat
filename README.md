FG Restricted Aircraft
----------------------

This git repository contains several FG aircraft as submodules. These Aircraft
contain varying restricting licenses, including but not limited to Creative
Commons, and No-Commercial Share alike.

Please verify the content of each aircraft for a LICENSE, COPYING file or
similar that declares the license for the respective submodule, and follow its
conditions. 

If you desire to change the licensing clauses, I recommend you attempt
contacting the copyright author(s) of the content and request a written
authorization. Typically a lot can be gain by asking politely, but in certain
circumstances, the author may be limited by preceding clauses, and thus the
work may not be able to be licensed differently.

Most of these aircraft allocated with submodules allow copying, and
redistribution; and also allow modifications. In these cases, the way that
will be most likely compliant is if such modifications are transferred with
identical licensing as inherited from the original work. Example, you are
authorized to modify a CC-BY-SA (Share Alike), if the derivative work remains
with identical or compatible clauses. 

Avoid modifying any material that is licensed under no-derivative (ND) or
similar clauses, that imply the copyright owner(s) do not authorizate the
creation of derivative work

And surely.
Have fun Flying

********

LICENSE of the primary repository
---------------------------------

<b>The primary repository is released under GPLv3 or later.</b> You can
copy/modify/redistribute it, but all modifications released by any public means
must retain the GPLv3 (or later) licensing. 

http://www.gnu.org/licenses/gpl-3.0-standalone.html

GPLv3 license only covers the primary repository, but <b>does not extend to the
submodules</b>. Each Aircraft submodule is a restricted aircraft with a
licensing condition different to GPL2 or GPL3. Verify the licensing conditions
of the submodules individually. Do not update a submodule if you do not agree
with its licensing conditions. Updating of the submodule is considered an
implicit agreeing with such conditions. <b>If you disagree with the licensing
condition of any aircraft, follow the submodule removal instructions provided below.</b>


***

Using the Repository (with submodules)
--------------------------------------

This repository can be used to manage the installation of one, many, or
serveral restricted license aircrafts for flightgear

It can be cloned anywhere in your hard-drive, and flightgear can be pointed to
this directory for additional aircraft (with the launchers, or the command
line)

     fgfs --fg-aircraft=$PATH_TO_FG-RestrictedAircrafts_REPO/Aircraft

To clone the primary repository
 
     git clone git@github.com:FGMEMBERS-RESTRICTED/FG-RestrictedAircrafts.git
     
To initialize a submodule

     git submodule init Aircraft/DavePack

To update all initialized submodules (it does not install non-initialized
submodules )

      git submodule update

To update a given submodule
  
      git submodule update Aircraft/DavePack

To update and initialize any submodule (one line)

      git submodule update Aircraft/DavePack --initialize

To initialize all submodules 

      git submodule init

To install all submodules (one line)

      git submodule update --init


De-install an aircraft
-------------------------

You can de-install any of these aircraft (to release space on your
hard-drive), or because you do not agree with its licensing conditions. 

*In fact you can install and deinstall any of these aircraft as many times as   you consider convenient. And it is very easy to do so, with the submodules*


To deinit a submodule

       git submodule deinit Aircraft/DavePack

To remove a submodule after deinitialization

        git submodule update Aircraft/DavePack

To remove/install all submodule initialized or de-initialized

        git submodule update
 
to deinit all submodules

        git submodule deinit


***

IAHM-COL
:copyright: 2015
