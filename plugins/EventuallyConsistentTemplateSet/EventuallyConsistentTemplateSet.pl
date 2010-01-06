package MT::Plugin::EventuallyConsistentTemplateSet;

use strict;
use base qw( MT::Plugin );
our $VERSION = '1.0'; 
my $plugin = MT::Plugin::EventuallyConsistentTemplateSet->new({
   id          => 'EventuallyConsistentTemplateSet',
   key         => 'eventually-consistent-template-set',
   name        => 'Eventually Consistent Template Set',
   description => "A Movable Type Theme.",
   version     => $VERSION,
   author_name => "Pablo Alvarez Yañez",
   author_link => "http://xenome.azulneon.com",
   plugin_link => "http://github.com/EventuallyConsistentTemplateSet",
});
MT->add_plugin($plugin);

sub init_registry {
    my $plugin = shift;
    $plugin->registry({
        callbacks => {
            'blog_template_set_change' => \&on_template_set_change,
        },
        template_sets => {
            blogbase => {
                label => "Eventually Consistent Template Set",
                base_path => 'templates/blogbase',
                order => 600,
                templates => {
                    index => {
                        'main_index' => {
                            label => 'Main Index',
                            outfile => 'index.html',
                            rebuild_me => '1',
                        },
                        'archive_index' => {
                            label => 'Archive Index',
                            outfile => 'archives.html',
                            rebuild_me => '1',
                        },
                        'styles' => {
                            label => 'Stylesheet',
                            outfile => 'styles.css',
                            rebuild_me => '1',
                        },
                        'javascript' => {
                            label => 'JavaScript',
                            outfile => 'javascript.js',
                            rebuild_me => '1',
                        },
                        'feed_recent' => {
                            label => 'Feed - Recent Entries',
                            outfile => 'atom.xml',
                            rebuild_me => '1',
                        },
                        'rsd' => {
                            label => 'RSD',
                            outfile => 'rsd.xml',
                            rebuild_me => '1',
                        },
                        'theme_javascript' => {
                            label => 'Theme Javascript',
                            outfile => 'theme_javascript.js',
                            rebuild_me => '1',
                        },
                    },
                    archive => {
                        'monthly_entry_listing' => {
                            label => 'Monthly Entry Listing',
                            mappings => {
                                monthly => {
                                    archive_type => 'Monthly',
                                },
                            },
                        },
                        'category_entry_listing' => {
                            label => 'Category Entry Listing',
                            mappings => {
                                category => {
                                    archive_type => 'Category',
                                },
                            },
                        },
                    },
                    individual => {
                        'entry' => {
                            label => 'Entry',
                            mappings => {
                                entry_archive => {
                                    archive_type => 'Individual',
                                },
                            },
                        },
                        'page' => {
                            label => 'Page',
                            mappings => {
                                page_archive => {
                                    archive_type => 'Page',
                                },
                            },
                        },
                    },
                    module => {
                        'about_me' => {
                            label => 'About Me',
                        },
                        'banner_footer' => {
                            label => 'Banner Footer',
                        },
                        'banner_header' => {
                            label => 'Banner Header',
                        },
                        'categories' => {
                            label => 'Categories',
                        },
                        'entry_summary' => {
                            label => 'Entry Summary',
                        },
                        'html_head' => {
                            label => 'HTML Head',
                        },
                        'individual_comment' => {
                            label => 'Individual Comment',
                        },
                        'sidebar' => {
                            label => 'Sidebar',
                        },   
                        'comments' => {
                            label => 'Comments',
                        },
                        'monthly' => {
                            label => 'Monthly',
                        },
                        'recent_comments' => {
                            label => 'Recent Comments',
                        },
                        'recent_entries' => {
                            label => 'Recent Entries',
                        },
                        'trackbacks' => {
                            label => 'Trackbacks',
                        },
                        'userpic' => {
                            label => 'Userpic',
                        },
                    },
                    system => {
                        'comment_preview' => {
                            label => 'Comment Preview',
                        },
                        'comment_response' => {
                            label => 'Comment Response',
                        },
                        'dynamic_error' => {
                            label => 'Dynamic Error',
                        },
                        'popup_image' => {
                            label => 'Popup Image',
                        },
                        'search_results' => {
                            label => 'Search Results',
                        },
                    },
                },
            },
        },
    });
}

1;
