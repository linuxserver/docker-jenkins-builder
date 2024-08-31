#!/usr/bin/python

from ansible.module_utils.common.text.converters import to_native
import re
import sys


class FilterModule(object):
    def filters(self):
        return {'admonition': self.admonition}

    def admonition(self, text, flavour="gfm", severity:str = "note", collapse=None, title=None):
        severities_flavours = {
            "mkdocs": {
                "abstract":"abstract",
                "bug":"bug",
                "danger":"danger",
                "failure":"failure",
                "info":"info",
                "note":"note",
                "question":"question",
                "quote":"quote",
                "success":"success",
                "tip":"tip",
                "warning":"warning",
            }, # https://squidfunk.github.io/mkdocs-material/reference/admonitions/#supported-types
            "gfm": {
                "abstract":"NOTE",
                "bug":"IMPORTANT",
                "danger":"WARNING",
                "failure":"CAUTION",
                "info":"NOTE",
                "note":"NOTE",
                "question":"TIP",
                "quote":"NOTE",
                "success":"TIP",
                "tip":"TIP",
                "warning":"WARNING",
            }, # https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#alerts
        }

        flavour = flavour if flavour in severities_flavours.keys() else "gfm"

        severities = severities_flavours.get(flavour)

        note = ""


        aa_severity = severity

        if severity == "deprecation":
            note = f"# DEPRECATION NOTICE \n{text}"
        elif flavour == "gfm":
            severity = severities.get(severity,"NOTE")
            text = text.replace("\n", "\n>")
            note = f">[!{severity}]\n>{text}"
        elif flavour == "mkdocs":
            severity = severities.get(severity, "note")
            if collapse == None:
                note = "!!!"
            elif collapse:
                note = "???+"
            else:
                note = "???"
            note += f" {severity}"
            note += f" \"{title}\"" if title else ""
            text = text.replace("\n", "\n    ")
            note += f"\n\n    {text}"

        return note

