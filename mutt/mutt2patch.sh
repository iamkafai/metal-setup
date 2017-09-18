#!/usr/bin/env bash

PATCH_FILE=$(mktemp $HOME/tmp/mutt/mutt-patch.XXXXXX)
cat > $PATCH_FILE
MAILBOX=`cat $PATCH_FILE | formail -c -xSubject: | tr "'" "." | sed -e '{ s@^ @@g; s@\[@@g; s@\]@@g; s@[*()" 	]@_@g; s@[/:]@-@g; s@^ \+@@; s@\.\.@.@g; s@-_@_@g; s@__@_@g; s@\.$@@; }' | cut -c 1-70`.patch

mv $PATCH_FILE $HOME/kernel/incoming/$MAILBOX
