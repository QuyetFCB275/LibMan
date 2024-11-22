package org.quyet.libman.dao;

import org.quyet.libman.model.Document642;

import java.util.List;

public interface DocumentDAO642 {
    List<Document642> getDocumentsByName(String name);
}
