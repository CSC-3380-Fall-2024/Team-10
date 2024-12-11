/// @description Cleans up the particle system by deleting related structures and destroying the particle system.
/// @param {struct} emitter_size - The structure holding the emitter's size data to be deleted.
/// @param {struct} offset - The structure holding the particle's offset data to be deleted.
/// @param {part_type} pt - The particle type to be destroyed.
/// @param {part_system} ps - The particle system to be destroyed.
/// @param {part_emitter} pe - The particle emitter to be destroyed.

delete emitter_size;  // Delete the structure holding the emitter's size data
delete offset;  // Delete the structure holding the particle's offset data

// Clean up particle system components
part_type_destroy(pt);  // Destroy the particle type (free its resources)
part_emitter_destroy(ps, pe);  // Destroy the emitter within the particle system
part_system_destroy(ps);  // Destroy the entire particle system
