package Bencher::Scenario::PerlPhase;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark Perl::Phase',
    participants => [
        {
            name => 'GLOBAL_PHASE-compile_time',
            code_template => '${^GLOBAL_PHASE} eq "START" ? 1:0',
        },
        # XXX: INIT
        {
            name => 'GLOBAL_PHASE-run_time',
            code_template => '${^GLOBAL_PHASE} eq "RUN" ? 1:0',
        },
        {
            name => 'Perl::Phase::is_compile_time',
            code_template => 'use Perl::Phase; Perl::Phase::is_compile_time() ? 1:0',
        },
        {
            name => 'Perl::Phase::is_run_time',
            code_template => 'use Perl::Phase; Perl::Phase::is_run_time() ? 1:0',
        },
    ],
};

1;
# ABSTRACT:

=head1 BENCHMARK NOTES

L<Perl::Phase> claims to be much faster than checking C<${^GLOBAL_PHASE}>,
because it's a numeric vs string comparison. This benchmark doesn't seem to show
that.
