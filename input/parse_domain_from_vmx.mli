(* virt-v2v
 * Copyright (C) 2017-2021 Red Hat Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 *)

type vmx_source =
  | File of string              (** local file or NFS *)
  | SSH of Xml.uri              (** SSH URI *)

val vmx_source_of_arg : [`SSH] option -> string -> vmx_source
val parse_domain_from_vmx : vmx_source -> Types.source * string list

(* XXX Exporting these is a hack. *)
val path_of_uri : Xml.uri -> string
val server_of_uri : Xml.uri -> string
val port_of_uri : Xml.uri -> int option
val remote_file_exists : Xml.uri -> string -> bool
