
package AutoselectSignin::Plugin;

use strict;
use warnings;


sub add_awesome {
    my ($cb, $app, $param, $tmpl) = @_;
    return if $app->mode ne 'login';

    my $plugin = MT->component('AutoselectSignin') or return;
    my $add = $plugin->load_tmpl('addenda.tmpl') or return;

    my $el = $tmpl->createElement('setvarblock');
    $el->setAttribute('name', 'html_head');
    $el->setAttribute('append', '1');
    $el->innerHTML($add->text);
    $tmpl->insertBefore($el);
}


1;

