
package WTSI::DNAP::Warehouse::Schema::Result::IseqHeronProductMetric;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

WTSI::DNAP::Warehouse::Schema::Result::IseqHeronProductMetric - Heron project additional metrics

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components('InflateColumn::DateTime');

=head1 TABLE: C<iseq_heron_product_metrics>

=cut

__PACKAGE__->table('iseq_heron_product_metrics');

=head1 ACCESSORS

=head2 id_iseq_hrpr_metrics_tmp

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

Internal to this database id, value can change

=head2 created

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 1

Datetime this record was created

=head2 last_changed

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 1

Datetime this record was created or changed

=head2 id_iseq_product

  data_type: 'char'
  is_foreign_key: 1
  is_nullable: 0
  size: 64

Product id, a foreign key into iseq_product_metrics table

=head2 supplier_sample_name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

Sample name given by the supplier, as recorded by WSI

=head2 artic_qc_outcome

  data_type: 'char'
  is_nullable: 1
  size: 15

Artic pipeline QC outcome, 'TRUE', 'FALSE' or a NULL value

=head2 climb_upload

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

Datetime files for this sample were uploaded to CLIMB

=head2 cog_sample_meta

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

A Boolean flag to mark sample metadata upload to COG

=head2 file_name_root

  data_type: 'char'
  is_nullable: 1
  size: 15

The file name root for teh entity

=head2 pct_n_bases

  data_type: 'float'
  is_nullable: 1

Percent of N bases

=head2 pct_covered_bases

  data_type: 'float'
  is_nullable: 1

Percent of covered bases

=head2 longest_no_n_run

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 1

Longest consensus data stretch without N

=head2 num_aligned_reads

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

Number of aligned filtered reads

=cut

__PACKAGE__->add_columns(
  'id_iseq_hrpr_metrics_tmp',
  {
    data_type => 'bigint',
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  'created',
  {
    data_type => 'datetime',
    datetime_undef_if_invalid => 1,
    default_value => 'CURRENT_TIMESTAMP',
    is_nullable => 1,
  },
  'last_changed',
  {
    data_type => 'datetime',
    datetime_undef_if_invalid => 1,
    default_value => 'CURRENT_TIMESTAMP',
    is_nullable => 1,
  },
  'id_iseq_product',
  { data_type => 'char', is_foreign_key => 1, is_nullable => 0, size => 64 },
  'supplier_sample_name',
  { data_type => 'varchar', is_nullable => 1, size => 255 },
  'artic_qc_outcome',
  { data_type => 'char', is_nullable => 1, size => 15 },
  'climb_upload',
  {
    data_type => 'datetime',
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  'cog_sample_meta',
  { data_type => 'tinyint', extra => { unsigned => 1 }, is_nullable => 1 },
  'file_name_root',
  { data_type => 'char', is_nullable => 1, size => 15 },
  'pct_n_bases',
  { data_type => 'float', is_nullable => 1 },
  'pct_covered_bases',
  { data_type => 'float', is_nullable => 1 },
  'longest_no_n_run',
  { data_type => 'smallint', extra => { unsigned => 1 }, is_nullable => 1 },
  'num_aligned_reads',
  { data_type => 'bigint', extra => { unsigned => 1 }, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_iseq_hrpr_metrics_tmp>

=back

=cut

__PACKAGE__->set_primary_key('id_iseq_hrpr_metrics_tmp');

=head1 UNIQUE CONSTRAINTS

=head2 C<iseq_hrm_digest_unq>

=over 4

=item * L</id_iseq_product>

=back

=cut

__PACKAGE__->add_unique_constraint('iseq_hrm_digest_unq', ['id_iseq_product']);

=head2 C<iseq_hrm_fnr_unq>

=over 4

=item * L</file_name_root>

=back

=cut

__PACKAGE__->add_unique_constraint('iseq_hrm_fnr_unq', ['file_name_root']);

=head1 RELATIONS

=head2 iseq_product

Type: belongs_to

Related object: L<WTSI::DNAP::Warehouse::Schema::Result::IseqProductMetric>

=cut

__PACKAGE__->belongs_to(
  'iseq_product',
  'WTSI::DNAP::Warehouse::Schema::Result::IseqProductMetric',
  { id_iseq_product => 'id_iseq_product' },
  { is_deferrable => 1, on_delete => 'NO ACTION', on_update => 'NO ACTION' },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-11 17:00:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6r9rJg+rDztTUZetUs9iCg

our $VERSION = '0';

__PACKAGE__->meta->make_immutable;
1;

=head1 SYNOPSIS

=head1 DESCRIPTION

Result class definition in DBIx binding for the multi-lims warehouse database.

=head1 DIAGNOSTICS

=head1 CONFIGURATION AND ENVIRONMENT

=head1 SUBROUTINES/METHODS

=head1 DEPENDENCIES

=over

=item strict

=item warnings

=item Moose

=item MooseX::NonMoose

=item MooseX::MarkAsMethods

=item DBIx::Class::Core

=item DBIx::Class::InflateColumn::DateTime

=back

=head1 INCOMPATIBILITIES

=head1 BUGS AND LIMITATIONS

=head1 AUTHOR

Marina Gourtovaia E<lt>mg8@sanger.ac.ukE<gt>

=head1 LICENSE AND COPYRIGHT

Copyright (C) 2020 Genome Research Ltd.

This file is part of the ml_warehouse package L<https://github.com/wtsi-npg/ml_warehouse>.

NPG is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

=cut
