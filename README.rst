============
Nova Formula
============

Install and configure the OpenStack Nova service.

.. note::
    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``nova.db``
-----------

Create the db for Nova service.

``nova.keystone``
-----------------

Init the Nova user, service and endpoint.

``nova.all-in-one``
-------------------

Install the Nova service all in one mode.

``nova.controller``
-------------------

Install the Nova service on controller node.

``nova.compute``
----------------

Install the Nova service on compute node.
